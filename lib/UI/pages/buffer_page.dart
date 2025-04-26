import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';
import 'package:uanimurs/UI/pages/player_page.dart';

import '../../Logic/services/aniwatch_services.dart';

class BufferPage extends StatefulWidget {
  final String episodeId;
  final String serverName;
  final String type;
  final int episodeNumber;
  final Episodes episodes;
  final Anime anime;
  final AnimeModel animeModel;
  final WatchHistory? watchHistory;
  const BufferPage({
    super.key,
    required this.episodeId,
    required this.serverName,
    required this.type,
    required this.episodeNumber,
    required this.episodes,
    required this.anime,
    required this.animeModel,
    this.watchHistory,
  });

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {

  late Future<StreamingLink> streamLink;

  @override
  void initState() {
    super.initState();
    // Use edgeToEdge instead of immersiveSticky
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,overlays: []
    );

    // Keep the transparent UI overlays
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    // Keep landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    streamLink = AniWatchService().getStreamingLink(widget.episodeId, widget.serverName,widget.type);
  }

  @override
  void dispose() {
    // Restore the original UI mode from main
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

    // Restore all orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: streamLink,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return PlayerPage(streamingLink: snapshot.data!, episodeNumber: widget.episodeNumber,episodes: widget.episodes,anime: widget.anime,serverName: widget.serverName,animeModel: widget.animeModel,watchHistory: widget.watchHistory,);
            }else if(snapshot.hasError){
              return Center(
                child: Text("Error loading stream link"),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}

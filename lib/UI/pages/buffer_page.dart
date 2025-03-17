import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/UI/pages/player/player_page.dart';

import '../../Logic/services/aniwatch_services.dart';

class BufferPage extends StatefulWidget {
  final String episodeId;
  final String serverName;
  final String type;
  final int episodeNumber;
  final Episodes episodes;
  const BufferPage({
    super.key,
    required this.episodeId,
    required this.serverName,
    required this.type,
    required this.episodeNumber,
    required this.episodes
  });

  @override
  State<BufferPage> createState() => _BufferPageState();
}

class _BufferPageState extends State<BufferPage> {

  late Future<StreamingLink> streamLink;

  @override
  void initState() {
    streamLink = AniWatchService().getStreamingLink(widget.episodeId, widget.serverName,widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: streamLink,
          builder: (context,snapshot){
            if(snapshot.hasData){
              return PlayerPage(streamingLink: snapshot.data!, episodeNumber: widget.episodeNumber,episodes: widget.episodes,);
            }else if(snapshot.hasError){
              return Center(
                child: Text("Error loading stream link"),
              );
            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text("Buffering ...")
                  ],
                ),
              );
            }
          }
      ),
    );
  }
}

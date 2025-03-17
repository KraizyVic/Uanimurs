import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:video_player/video_player.dart';

import '../../Logic/services/aniwatch_services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


class PlayerPage extends StatefulWidget {
  final StreamingLink streamingLink;
  const PlayerPage({
    super.key,
    required this.streamingLink
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController _controller;
  late Future<List<Map<String, String>>> _qualityLinks;


  @override
  void initState() {
    print(widget.streamingLink.sources[0].url);
    _qualityLinks = AniWatchService().getQualityLinks(widget.streamingLink.sources[0].url);
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.streamingLink.sources[0].url),
        httpHeaders: {
          "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36",
          "X-ANIWATCH-CACHE-EXPIRY": "120"
          }
    )..initialize().then((_) {
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      _controller.play();
      setState(() {});
      WakelockPlus.enable();
    });
    _controller.addListener(() {
      if (!_controller.value.isPlaying) {
        WakelockPlus.disable(); // Allow screen sleep when paused/stopped
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WakelockPlus.disable();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              widget.streamingLink.sources[0].url,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _qualityLinks,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    /*for (var quality in snapshot.data!) {
                      print("${quality['quality']} -> ${quality['url']}");
                    }*/
                    return Column(
                      children: [
                        //Text(snapshot.data![1]["url"].toString()),
                        Text("Quality Links:"),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: Text(snapshot.data![index]["quality"]!),
                                onTap: (){
                                  print(snapshot.data![index]["url"]!);
                                  setState(() {
                                    _controller.dispose();
                                    _controller = VideoPlayerController.networkUrl(
                                      Uri.parse(snapshot.data![index]["url"]!),
                                    );
                                  });
                                  _controller.initialize().then((_) {
                                    _controller.play();
                                    setState(() {});
                                  });
                                }
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

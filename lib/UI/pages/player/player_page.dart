import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/UI/pages/player/player_page_items.dart';
import 'package:video_player/video_player.dart';

import '../../../Logic/services/aniwatch_services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


class PlayerPage extends StatefulWidget {
  final StreamingLink streamingLink;
  final int episodeNumber;
  final Episodes episodes;
  const PlayerPage({
    super.key,
    required this.episodeNumber,
    required this.streamingLink,
    required this.episodes
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController _controller;
  late Future<List<Map<String, String>>> _qualityLinks;
  bool _isPlaying = false;
  bool _isWakeLockEnabled = false;
  List<Subtitle> subtitles = [];
  String currentSubtitle = '';
  Timer? _subtitleTimer;

  bool _showControls = false;
  Timer? _hideTimer;


  @override
  void initState() {
    super.initState();
    _qualityLinks = AniWatchService().getQualityLinks(widget.streamingLink.sources[0].url);
    _initializeVideoPlayer(widget.streamingLink.sources[0].url);
    _showControlsAndStartTimer();

  }


  Future<void> _initializeVideoPlayer(String videoUrl) async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    _controller.play(); 
    _fetchSubtitles(widget.streamingLink.tracks.firstWhere((t) => t.trackDefault || t.label == "English", orElse: () => widget.streamingLink.tracks.first).file);
    // Listen for video playback state changes
    _controller.addListener(() {
      if (_controller.value.isPlaying && !_isWakeLockEnabled) {
        WakelockPlus.enable(); // Enable wake lock when video starts playing

        setState(() {
          _isWakeLockEnabled = true;
        });
      } else if (!_controller.value.isPlaying && _isWakeLockEnabled) {
        WakelockPlus.disable(); // Disable wake lock when video pauses
        setState(() {
          _isWakeLockEnabled = false;
        });
      }
    });
  }


  Future<void> _fetchSubtitles(String subtitleUrl) async {
    final url = subtitleUrl; // Replace with your .vtt URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      subtitles = _parseVTT(response.body);
      _startSubtitleSync();
    } else {
      print('Failed to load subtitles');
    }
  }

  List<Subtitle> _parseVTT(String vttContent) {
    final lines = vttContent.split('\n');
    List<Subtitle> parsedSubtitles = [];
    RegExp timeRegex = RegExp(r'(\d+):(\d+):(\d+\.\d+) --> (\d+):(\d+):(\d+\.\d+)');

    for (int i = 0; i < lines.length; i++) {
      if (timeRegex.hasMatch(lines[i])) {
        final match = timeRegex.firstMatch(lines[i])!;
        int startMs = _convertToMs(match.group(1), match.group(2), match.group(3));
        int endMs = _convertToMs(match.group(4), match.group(5), match.group(6));

        String subtitleText = '';
        int j = i + 1;
        while (j < lines.length && lines[j].trim().isNotEmpty) {
          subtitleText += '${lines[j]}\n';
          j++;
        }

        parsedSubtitles.add(Subtitle(startTime: startMs, endTime: endMs, text: subtitleText.trim()));
      }
    }

    return parsedSubtitles;
  }

  int _convertToMs(String? hours, String? minutes, String? seconds) {
    return (int.parse(hours!) * 3600000) +
        (int.parse(minutes!) * 60000) +
        (double.parse(seconds!) * 1000).toInt();
  }

  void _startSubtitleSync() {
    _subtitleTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (!_controller.value.isPlaying) return;
      final position = _controller.value.position.inMilliseconds;
      final matchingSub = subtitles.firstWhere(
            (sub) => position >= sub.startTime && position <= sub.endTime,
        orElse: () => Subtitle(startTime: 0, endTime: 0, text: ''),
      );

      if (matchingSub.text != currentSubtitle) {
        setState(() {
          currentSubtitle = matchingSub.text;
        });
      }
    });
  }

  void _showControlsAndStartTimer() {
    setState(() {
      _showControls = true;
    });
    // Cancel any existing timer and start a new one
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(seconds: 10), () {
      setState(() {
        _showControls = false; // Auto-hide controls after 5 seconds
      });
    });
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode ${widget.episodeNumber}"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                _controller.value.isInitialized ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ) : Center(child: const CircularProgressIndicator()),
                Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        color: Colors.black54,
                        child: Text(
                          currentSubtitle,
                          style: TextStyle(color: Colors.white,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _showControlsAndStartTimer();
                  },
                ),
                _showControls ? PlayerControls(controller: _controller,): Container(),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _qualityLinks,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Column(
                      children: [
                        //Text("Quality Links:"),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return ListTile(
                                title: Text(snapshot.data![index]["quality"]!),
                                onTap: (){
                                  _controller.dispose();
                                  _initializeVideoPlayer(snapshot.data![index]["url"]!);
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
            _isPlaying = !_isPlaying;
            if (_isPlaying) {
              _controller.play();
            } else {
              _controller.pause();
            }
          });
        },
      )
    );
  }
}

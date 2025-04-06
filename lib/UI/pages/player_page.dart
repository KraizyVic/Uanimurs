import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/UI/custom_widgets/player_page_items.dart';
import 'package:uanimurs/UI/pages/buffer_page.dart';
import 'package:video_player/video_player.dart';

import '../../Logic/services/aniwatch_services.dart';
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
  late Future<List<M3U8Quality>> _qualityLinks;
  List<Subtitle> subtitles = [];
  String currentSubtitle = '';
  bool _isWakeLockEnabled = false;
  Timer? _subtitleTimer;
  bool _showControls = false;
  Timer? _hideTimer;
  bool _isFullScreen = false;
  int isSelectedSubtitleIndex = 0;
  int selectedQualityIndex = 0;
  int elapsedTime = 0;
  bool hasBeenPaused = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  void initState() {
    super.initState();

    // Use edgeToEdge instead of immersiveSticky
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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

    isSelectedSubtitleIndex = widget.streamingLink.tracks.indexWhere((t) => t.trackDefault);
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
    _fetchSubtitles(widget.streamingLink.tracks.firstWhere((t) => t.trackDefault, orElse: () => widget.streamingLink.tracks.first).file);
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

  // DRAWER ITEMS
  Widget drawerItem(String drawerTitler){
    if(drawerTitler == "Audio"){
      return Container(
        color: Colors.red,
      );
    }else if(drawerTitler == "Video"){
      return Container(
        color: Colors.blue,
        child: FutureBuilder(
          future: _qualityLinks,
          builder: (context,snapshot){
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(""),
                );
              }
            );
          }
        ),
      );
    }else{
      return Container(
        color: Colors.green,
      );
    }
  }

  @override
  void dispose() {
    WakelockPlus.disable();
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
    _controller.dispose();
    _subtitleTimer?.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }
  String drawerTitle = "Video";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        shape: RoundedRectangleBorder(),
        backgroundColor: Colors.black87,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                drawerTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              if (drawerTitle == "Audio") ...[
                Expanded(
                  child: Center(
                    child: Text("Coming SOON"),
                  ),
                )
              ] else if (drawerTitle == "Video") ...[
                Expanded(
                  child: FutureBuilder(
                    future: _qualityLinks,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){
                            return ListTile(
                                onTap: () async {
                                  // Save elapsed time
                                  elapsedTime = _controller.value.position.inMilliseconds;
                                  // Dispose the old controller BEFORE setState
                                  await _controller.dispose();
                                  // Create a new video controller
                                  final newController = VideoPlayerController
                                      .networkUrl(
                                      Uri.parse(snapshot.data![index].url)
                                  );
                                  // Initialize the new controller
                                  await newController.initialize();
                                  // Seek to the saved position
                                  await newController.seekTo(
                                      Duration(milliseconds: elapsedTime));
                                  // Set the new controller in state
                                  if (mounted) {
                                    setState(() {
                                      _controller = newController;
                                      selectedQualityIndex = index;
                                      _controller.play();
                                    });
                                  }
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                //tileColor: index == selectedQualityIndex ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                                title: Text(snapshot.data![index].quality,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                subtitle: Text(snapshot.data![index].url.split("/").last.split(".")[0]),
                                trailing: index == selectedQualityIndex ? Icon(Icons.check,color: Theme.of(context).colorScheme.primary,) : null,
                            );
                          }
                        );
                      }else if(snapshot.hasError){
                        return Center(child: Text("Error"));
                      }else{
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  )
                )
              ] else if (drawerTitle == "Subtitles") ...[
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.streamingLink.tracks.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        tileColor: index == isSelectedSubtitleIndex ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                        onTap: (){
                          setState(() {
                            //widget.streamingLink.tracks[index].trackDefault = true;
                            isSelectedSubtitleIndex = index;
                            elapsedTime = _controller.value.position.inMilliseconds;
                            _fetchSubtitles(widget.streamingLink.tracks[index].file);
                          });
                        },
                        title: Text(widget.streamingLink.tracks[index].label,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        subtitle: Text(widget.streamingLink.tracks[index].kind),
                        trailing: isSelectedSubtitleIndex == index ? Icon(Icons.check,color: Theme.of(context).colorScheme.primary,) : null,
                      );
                    }
                  )
                )
              ],
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Episodes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.episodes.episodes.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: widget.episodes.episodes[index].episodeId, serverName: "megacloud", type: "sub", episodeNumber: index, episodes: widget.episodes,))),
                      //autofocus: widget.episodes.episodes[index].episodeNo-1 == widget.episodeNumber,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      tileColor: widget.episodes.episodes[index].episodeNo-1 == widget.episodeNumber ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                      title: Text("Episode ${widget.episodes.episodes[index].episodeNo}",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      subtitle: Text(widget.episodes.episodes[index].name),
                      trailing: widget.episodes.episodes[index].episodeNo-1 == widget.episodeNumber ? Icon(Icons.play_arrow,color: Theme.of(context).colorScheme.primary,) : null,
                    );
                  }
                )
              )
            ],
          )
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            _controller.value.isInitialized ? Center(child: AspectRatio(aspectRatio: _controller.value.aspectRatio,child: VideoPlayer(_controller))) : Center(child: CircularProgressIndicator()),
            ! _controller.value.isPlaying && _controller.value.isBuffering ? Center(
              child: CircularProgressIndicator(),
            ) : Container(),
            // Subtitle display
            Center(
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black54,
                      child: Text(
                        currentSubtitle,
                        style: TextStyle(color: Colors.white,fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
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
            _showControls ? PlayerControls(
              isFullScreen: true,
              episodes: widget.episodes,
              episodeIndex: widget.episodeNumber,
              controller: _controller,
              scaffoldKey: _scaffoldKey,
              resetControlTimer: (){
                _showControlsAndStartTimer();
              },
              toggleOffControls: (){
                setState(() {
                  _showControls = false;
                });
              },
              onAudioAtap: () {
                _controller.pause();
                setState(() {
                  drawerTitle = "Audio";
                });
                print(drawerTitle);
                _scaffoldKey.currentState!.openDrawer(); // 🔥 Open drawer dynamically
              },

              onVideoTap: () {
                _controller.pause();
                setState(() {
                  drawerTitle = "Video";
                });
                _scaffoldKey.currentState!.openDrawer(); // 🔥 Open drawer dynamically
              },

              onSubtitleTap: () {
                //_controller.pause();
                setState(() {
                  drawerTitle = "Subtitles";
                });
                _scaffoldKey.currentState!.openDrawer(); // 🔥 Open drawer dynamically
              },

              fullScreen: IconButton(
                icon: Icon(
                  _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: (){},
              ),
            ): Container(),
          ],
        ),
      ),
    );
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/custom_widgets/pages_items/player_page_items.dart';
import 'package:uanimurs/UI/pages/buffer_page.dart';
import 'package:uanimurs/Database/constants.dart';
import 'package:video_player/video_player.dart';

import '../../Logic/bloc/app_cubit.dart';
import '../../Logic/models/app_model.dart';
import '../../Logic/models/watch_history.dart';
import '../../Logic/services/aniwatch_services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';


class PlayerPage extends StatefulWidget {
  final StreamingLink streamingLink;
  final int episodeNumber;
  final Episodes? episodes;
  final AnimeModel animeModel;
  final Anime anime;
  final String serverName;
  final WatchHistory? watchHistory;
  final Future<Episodes>? episodesFuture;
  final bool isInWatchHistory;
  final bool isContinuePress;

  const PlayerPage({
    super.key,
    required this.episodeNumber,
    required this.streamingLink,
    required this.episodes,
    required this.animeModel,
    required this.anime,
    required this.serverName,
    this.watchHistory,
    this.episodesFuture,
    required this.isInWatchHistory,
    required this.isContinuePress,
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

  late Future <Episodes> episodes ;

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


    isSelectedSubtitleIndex = widget.streamingLink.tracks!.indexWhere((t) => t.trackDefault ?? false);
    _qualityLinks = AniWatchService().getQualityLinks(widget.watchHistory == null ? widget.streamingLink.sources?.first.url ?? "" : widget.watchHistory!.streamingLink?.sources?.first.url ?? "");
    _initializeVideoPlayer(
        widget.watchHistory != null && widget.isContinuePress ? widget.watchHistory!.streamingLink?.sources?.first.url ?? ""  : widget.streamingLink.sources?.first.url ?? "",
        widget.watchHistory != null && widget.isContinuePress ? widget.watchHistory!.watchTime! : 0
    );
    _showControlsAndStartTimer();
  }



  Future<void> _initializeVideoPlayer(String videoUrl,int elapsedTime) async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
      httpHeaders: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.11',
        "origin": "https://megacloud.blog",
        "referer": "https://megacloud.blog/",
      },
    )..initialize().then((_) async{
        if (mounted) {
          setState(() {});
        }
        //final position = widget.watchHistory?.watchTime ?? elapsedTime;
        await _controller.seekTo(Duration(milliseconds: elapsedTime));
        await _controller.setVolume(1);
        await _controller.play();
      });
    await _controller.play();
    _fetchSubtitles(widget.streamingLink.tracks!.firstWhere((t) => t.trackDefault ?? false, orElse: () => widget.streamingLink.tracks!.first).file ?? "");
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


  Future<void> _fetchSubtitles(String subtitleUrl) async {// Replace with your .vtt URL
    final response = await http.get(Uri.parse(subtitleUrl));
    final content = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      subtitles = _parseVTT(content);
      _startSubtitleSync();
    } else {
    }
  }

  List<Subtitle> _parseVTT(String vttContent) {
    final lines = vttContent.split('\n');
    List<Subtitle> parsedSubtitles = [];
    RegExp timeRegex = RegExp(r'(?:(\d+):)?(\d+):(\d+\.\d+)\s-->\s(?:(\d+):)?(\d+):(\d+\.\d+)');

    for (int i = 0; i < lines.length; i++) {
      if (timeRegex.hasMatch(lines[i])) {
        final match = timeRegex.firstMatch(lines[i])!;
        int startMs = _convertToMs(match.group(1), match.group(2), match.group(3));
        int endMs = _convertToMs(match.group(4), match.group(5), match.group(6));

        String subtitleText = '';
        int j = i + 1;
        while (j < lines.length && lines[j].trim().isNotEmpty) {
          subtitleText += '${lines[j].replaceAll(RegExp(r'<[^>]*>'), '')}\n';
          //subtitleText += '${cleanText(lines[j])}\n';
          j++;
        }

        parsedSubtitles.add(Subtitle(startTime: startMs, endTime: endMs, text: subtitleText.trim()));
      }
    }

    return parsedSubtitles;
  }

  int _convertToMs(String? hours, String? minutes, String? seconds) {
    int h = hours != null ? int.parse(hours) : 0;
    int m = int.parse(minutes!);
    int s = (double.parse(seconds!) * 1000).toInt();
    return h * 3600000 + m * 60000 + s;
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
  int aspectRatioIndex = 0;
  bool isPaused = false;
  int leftTapCount = 0;
  int rightTapCount = 0;


  Future<bool> _onWillPop(AppModel? state) async {
    if(state!.isLoggedIn && Supabase.instance.client.auth.currentSession != null){
      if(!widget.isInWatchHistory){
        WatchHistoryService().addWatchHistory(
          watchHistory: WatchHistory(
            anilistId: widget.animeModel.alId,
            anime: widget.anime,
            name: widget.anime.name,
            image: widget.anime.img,
            watchTime: _controller.value.position.inMilliseconds,
            totalTime: _controller.value.duration.inMilliseconds,
            lastWatched: DateTime.now(),
            streamingLink: widget.streamingLink,
            watchedEpisodes: [],
            watchingEpisode: widget.episodeNumber + 1,
            totalEpisodes: widget.episodes?.totalEpisodes ?? 0,
          ),
        );
      }else{
        WatchHistoryService().updateWatchHistory(
          watchHistory: widget.watchHistory!.copyWith(
            watchTime: _controller.value.position.inMilliseconds,
            totalTime: _controller.value.duration.inMilliseconds,
            lastWatched: DateTime.now(),
            streamingLink: widget.streamingLink,
            watchingEpisode: widget.episodeNumber + 1,
          ),
        );
      }
    }else{
      await context.read<AppCubit>().addOrUpdateWatchHistory(
        WatchHistory(
          anilistId: widget.animeModel.alId,
          anime: widget.anime,
          name: widget.anime.name,
          image: widget.anime.img,
          watchTime: _controller.value.position.inMilliseconds,
          totalTime: _controller.value.duration.inMilliseconds,
          lastWatched: DateTime.now(),
          streamingLink: widget.streamingLink,
          watchedEpisodes: [],
          watchingEpisode: widget.episodeNumber + 1,
          totalEpisodes: widget.episodes?.totalEpisodes ?? 0 ,
        ),
      );
    }
    return true; // let it pop
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppModel?>(
      builder: (context,state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              _onWillPop(state);
              Navigator.pop(context);
            }else {
              debugPrint("Screen popped with result: $result");
            }
          },
          child: OrientationBuilder(
            builder: (context,orientation) {
              return Scaffold(
                key: _scaffoldKey,
                drawer: Drawer(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black,
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
                                            final newController = VideoPlayerController.networkUrl(
                                              Uri.parse(snapshot.data![index].url,),
                                              httpHeaders: {
                                                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.11',
                                                "origin": "https://megacloud.blog",
                                                "referer": "https://megacloud.blog/",
                                              },
                                            );
                                            // Initialize the new controller
                                            await newController.initialize();
                                            // Seek to the saved position
                                            await newController.seekTo(Duration(milliseconds: elapsedTime));
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
                                  return Center(child: Text("Error",style: TextStyle(color: Colors.white),));
                                }else{
                                  return Center(child: CircularProgressIndicator());
                                }
                              }
                            )
                          )
                        ] else if (drawerTitle == "Subtitles") ...[
                          Expanded(
                            child: ListView.builder(
                              itemCount: widget.streamingLink.tracks?.length ?? 0,
                              itemBuilder: (context,index){
                                return ListTile(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  tileColor: index == isSelectedSubtitleIndex ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                                  onTap: (){
                                    setState(() {
                                      //widget.streamingLink.tracks[index].trackDefault = true;
                                      isSelectedSubtitleIndex = index;
                                      elapsedTime = _controller.value.position.inMilliseconds;
                                      _fetchSubtitles(widget.streamingLink.tracks?[index].file ?? "");
                                    });
                                  },
                                  title: Text(widget.streamingLink.tracks?[index].label ?? "",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                  subtitle: Text(widget.streamingLink.tracks?[index].kind ?? ""),
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
                  backgroundColor: Colors.black,
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
                          child: widget.episodes == null ? FutureBuilder(
                            future: widget.episodesFuture,
                            builder: (context,snapshot) {
                              if(snapshot.hasData){
                                return ListView.builder(
                                    itemCount: snapshot.data!.episodes.length,
                                    itemBuilder: (context,index){
                                      return ListTile(
                                        onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BufferPage(
                                          episodeId: snapshot.data!.episodes[index].episodeId,
                                          serverName: "megacloud",
                                          type: "sub",
                                          episodeNumber: index,
                                          episodes: snapshot.data!,
                                          anime: widget.anime,
                                          animeModel: widget.animeModel,
                                          isInWatchHistory: widget.isInWatchHistory,
                                        ))),
                                        //autofocus: widget.episodes.episodes[index].episodeNo-1 == widget.episodeNumber,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        tileColor: snapshot.data!.episodes[index].episodeNo-1 == widget.episodeNumber ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                                        title: Text("Episode ${snapshot.data!.episodes[index].episodeNo}",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                        subtitle: Text(snapshot.data!.episodes[index].name),
                                        trailing: snapshot.data!.episodes[index].episodeNo-1 == widget.episodeNumber ? Icon(Icons.play_arrow,color: Theme.of(context).colorScheme.primary,) : null,
                                      );
                                    }
                                );
                              }else if(snapshot.hasError){
                                return Center(
                                  child: Text("Error loading episodes"),
                                );
                              }else{
                                return Center( child: CircularProgressIndicator(),);
                              }
                            }
                          ) :  ListView.builder(
                              itemCount: widget.episodes!.episodes.length,
                              itemBuilder: (context,index){
                                return ListTile(
                                  onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BufferPage(
                                    episodeId: widget.episodes!.episodes[index].episodeId,
                                    serverName: widget.serverName, type: "sub",
                                    episodeNumber: index, episodes: widget.episodes! ,
                                    anime: widget.anime,animeModel: widget.animeModel,
                                    isInWatchHistory: widget.isInWatchHistory,
                                  ))),
                                  //autofocus: widget.episodes.episodes[index].episodeNo-1 == widget.episodeNumber,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  tileColor: widget.episodes!.episodes[index].episodeNo-1 == widget.episodeNumber ? Theme.of(context).colorScheme.primary.withAlpha(100) : Colors.transparent,
                                  title: Text("Episode ${widget.episodes!.episodes[index].episodeNo}",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                  subtitle: Text(widget.episodes!.episodes[index].name),
                                  trailing: widget.episodes!.episodes[index].episodeNo-1 == widget.episodeNumber ? Icon(Icons.play_arrow,color: Theme.of(context).colorScheme.primary,) : null,
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
                      _controller.value.isInitialized ? Center(
                        child: AspectRatio(
                            aspectRatio: aspectRatios(context)[aspectRatioIndex]["value"] == 0 ? _controller.value.aspectRatio : aspectRatios(context)[aspectRatioIndex]["value"],
                            child: VideoPlayer(_controller)
                        )
                        ) : Center(child: CircularProgressIndicator()),
                      isPaused ? Center(
                        child: _controller.value.isBuffering ? Container() : CircularProgressIndicator(),
                      ) : Center(
                        child: _controller.value.isBuffering && !_controller.value.isPlaying ? CircularProgressIndicator() : Container(),
                      ),
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
                      Row(
                        children: [
                          /*Expanded(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  leftTapCount++;
                                  Future.delayed(
                                    Duration(milliseconds:500), () {
                                      if (leftTapCount >= 2) {
                                        _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10 * leftTapCount-1));
                                        leftTapCount = 0;
                                      }else {
                                        leftTapCount = 0;
                                      }
                                    }
                                  );
                                });
                              },
                            ),
                          ),*/
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                _showControlsAndStartTimer();
                              },
                              onDoubleTap: (){
                                setState(() {
                                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                  isPaused = !_controller.value.isPlaying;
                                });
                              },
                            ),
                          ),
                          /*Expanded(
                            child: GestureDetector(
                              onTap: (){
                                _showControlsAndStartTimer();
                              },
                            ),
                          ),*/
                        ],
                      ),
                      !_showControls && isPaused  ? Center(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isPaused = false;
                            });
                            _controller.play();
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black54),
                              child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.play_arrow,size: 60,color: Theme.of(context).colorScheme.primary,),
                            )
                          )
                        )
                      ) : Container(),
                      _showControls ? PlayerControls(
                        isFullScreen: true,
                        episodes: widget.episodes == null ? Episodes(totalEpisodes: 0, episodes: []) : widget.episodes!,
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
                          //_controller.pause();
                          setState(() {
                            drawerTitle = "Audio";
                          });
                          _scaffoldKey.currentState!.openDrawer(); // Open drawer dynamically
                        },
                        onVideoTap: () {
                          _controller.pause();
                          setState(() {
                            drawerTitle = "Video";
                          });
                          _scaffoldKey.currentState!.openDrawer(); // Open drawer dynamically
                        },

                        onSubtitleTap: () {
                          //_controller.pause();
                          setState(() {
                            drawerTitle = "Subtitles";
                          });
                          _scaffoldKey.currentState!.openDrawer(); // Open drawer dynamically
                        },

                        onExit:()async{
                          if(state!.isLoggedIn && Supabase.instance.client.auth.currentSession != null){
                            if(!widget.isInWatchHistory){
                              WatchHistoryService().addWatchHistory(
                                watchHistory: WatchHistory(
                                  anilistId: widget.animeModel.alId,
                                  anime: widget.anime,
                                  name: widget.anime.name,
                                  image: widget.anime.img,
                                  watchTime: _controller.value.position.inMilliseconds,
                                  totalTime: _controller.value.duration.inMilliseconds,
                                  lastWatched: DateTime.now(),
                                  streamingLink: widget.streamingLink,
                                  watchedEpisodes: [],
                                  watchingEpisode: widget.episodeNumber + 1,
                                  totalEpisodes: widget.episodes?.totalEpisodes ?? 0,
                                )
                              );
                              Navigator.pop(context);
                            }else{
                              WatchHistoryService().updateWatchHistory(
                                watchHistory: WatchHistory(
                                  supabaseId: widget.watchHistory?.supabaseId,
                                  anilistId: widget.animeModel.alId,
                                  anime: widget.anime,
                                  name: widget.anime.name,
                                  image: widget.anime.img,
                                  watchTime: _controller.value.position.inMilliseconds,
                                  totalTime: _controller.value.duration.inMilliseconds,
                                  lastWatched: DateTime.now(),
                                  streamingLink: widget.streamingLink,
                                  watchedEpisodes: [],
                                  watchingEpisode: widget.episodeNumber + 1,
                                  totalEpisodes: widget.episodes?.totalEpisodes ?? 0,
                                )
                              );
                              Navigator.pop(context);
                            }
                          } else {
                            await context.read<AppCubit>().addOrUpdateWatchHistory(
                              WatchHistory(
                                anilistId: widget.animeModel.alId,
                                anime: widget.anime,
                                name: widget.anime.name,
                                image: widget.anime.img,
                                watchTime: _controller.value.position.inMilliseconds,
                                totalTime: _controller.value.duration.inMilliseconds,
                                lastWatched : DateTime.now(),
                                watchedEpisodes: [],
                                watchingEpisode: widget.episodeNumber + 1,
                                streamingLink: widget.streamingLink,
                                totalEpisodes: widget.episodes?.totalEpisodes ?? 0,
                              )
                            );
                            Navigator.pop(context);
                          }
                        },
                        onPause: (){
                          setState(() {
                            _controller.value.isPlaying ? _controller.pause() : _controller.play();
                            isPaused = !_controller.value.isPlaying;
                          });
                        },
                        anime: widget.anime,
                        animeModel: widget.animeModel,
                        episodeNumber: widget.episodeNumber,
                        serverName: widget.serverName,

                        fullScreen: IconButton(
                          icon: Icon(
                            _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                            color: Colors.white,
                          ),
                          onPressed: (){},
                        ),
                        changeAspectRatio: (){
                          setState(() {
                            aspectRatioIndex = (aspectRatioIndex + 1) % aspectRatios(context).length;
                          });
                        },
                        aspectRatioText: aspectRatios(context)[aspectRatioIndex]["label"],
                        isInWatchHistory: widget.isInWatchHistory,
                      ): Container(),
                    ],
                  ),
                ),
              );
            }
          ),
        );
      }
    );
  }
}
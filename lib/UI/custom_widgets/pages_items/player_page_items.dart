import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/UI/custom_widgets/pages_items/anime_details_page_items.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:uanimurs/UI/pages/buffer_page.dart';
import 'package:uanimurs/constants.dart';
import 'package:video_player/video_player.dart';

import '../../../Logic/bloc/account_cubit.dart';
import '../../../Logic/models/anime_model.dart';

class PlayerControls extends StatefulWidget {
  final Widget fullScreen;
  final bool isFullScreen;
  final Episodes episodes;
  final int episodeIndex;
  final VoidCallback toggleOffControls;
  final VoidCallback resetControlTimer;
  final VoidCallback onAudioAtap;
  final VoidCallback onVideoTap;
  final VoidCallback onSubtitleTap;
  final VoidCallback onExit;
  final VoidCallback onPause;
  final VoidCallback changeAspectRatio;
  final VideoPlayerController controller;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Anime anime;
  final int episodeNumber;
  final AnimeModel animeModel;
  final String serverName;
  final String aspectRatioText;

  const PlayerControls({
    super.key,
    required this.controller,
    required this.fullScreen,
    this.isFullScreen = false,
    required this.toggleOffControls,
    required this.resetControlTimer,
    required this.onAudioAtap,
    required this.onVideoTap,
    required this.onSubtitleTap,
    required this.onExit,
    required this.onPause,
    required this.changeAspectRatio,
    required this.episodes,
    required this.episodeIndex,
    required this.scaffoldKey,
    required this.anime,
    required this.animeModel,
    required this.episodeNumber,
    required this.serverName,
    required this.aspectRatioText,
  });

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {


  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return hours != "00" ? "$hours:$minutes:$seconds" : "$minutes:$seconds";
  }

  bool hasBeenPaused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.toggleOffControls,
      child: Container(
        color: Colors.black54,
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    MaterialButton(
                      onPressed: widget.onExit,
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios,color: Colors.white,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Episode ${widget.episodes.episodes[widget.episodeIndex].episodeNo}",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),
                              ),
                              Text(widget.episodes.episodes[widget.episodeIndex].name,style: TextStyle(color: Colors.white),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${widget.controller.value.size.width.toInt()} x ${widget.controller.value.size.height.toInt()}",
                    ),
                    widget.episodes.episodes.length > 1 ? MaterialButton(
                      onPressed: (){
                        //widget.controller.pause();
                        widget.scaffoldKey.currentState!.openEndDrawer();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Icon(Icons.folder,color: Colors.white,),
                          Text("Episodes",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ):SizedBox()
                  ]
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 100,
                    ),
                    widget.episodes.episodes.length > 1 ? buttonWithCenterIcon(
                      isActive: widget.episodes.episodes.length > 1 && widget.episodeIndex > 0 ,
                      Icons.skip_previous,
                      ()=>widget.episodeIndex > 0 ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: widget.episodes.episodes[widget.episodeIndex - 1].episodeId, serverName: widget.serverName, type: "sub", episodeNumber: widget.episodeNumber - 1, episodes: widget.episodes! ,anime: widget.anime,animeModel: widget.animeModel,))) : null,
                    ):SizedBox(),
                    SizedBox(width: 10,),
                    buttonWithCenterIcon(Icons.replay_10, ()=>widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds-10))),
                    SizedBox(width: 10,),
                    IconButton(
                      onPressed: widget.onPause,
                      icon: Icon(widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,size: 70,color: Colors.white,),
                    ),
                    SizedBox(width: 10,),
                    buttonWithCenterIcon(Icons.forward_10, ()=>widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds+10))),
                    SizedBox(width: 10,),
                    widget.episodes.episodes.length > 1 ? buttonWithCenterIcon(
                      isActive: widget.episodes.episodes.length > 1 && widget.episodeIndex < widget.episodes.episodes.length - 1,
                      Icons.skip_next,
                      ()=>widget.episodeIndex < widget.episodes.episodes.length - 1 ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: widget.episodes.episodes[widget.episodeIndex + 1].episodeId, serverName: widget.serverName, type: "sub", episodeNumber: widget.episodeNumber + 1, episodes: widget.episodes ,anime: widget.anime,animeModel: widget.animeModel,))) : null,
                    ) : SizedBox(),
                    Spacer(),
                    SizedBox(
                      width: 100,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  /// Listen to controller changes and update only this Text widget
                  ValueListenableBuilder(
                    valueListenable: widget.controller,
                    builder: (context, VideoPlayerValue value, child) {
                      return Text(formatDuration(value.position),style: TextStyle(color: Colors.white));
                    },
                  ),

                  /// Listen and update only the Slider
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: widget.controller,
                      builder: (context, VideoPlayerValue value, child) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Slider(
                            padding: EdgeInsets.all(0),
                            value: value.position.inSeconds.toDouble(),
                            min: 0,
                            max: value.duration.inSeconds.toDouble(),
                            onChanged: (newValue) {
                              widget.controller.seekTo(Duration(seconds: newValue.toInt()));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  /// Listen and update only this Text widget
                  ValueListenableBuilder(
                    valueListenable: widget.controller,
                    builder: (context, VideoPlayerValue value, child) {
                      return Text(formatDuration(value.duration),style: TextStyle(color: Colors.white));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.aspect_ratio,color: Colors.transparent,),
                  ),
                  Spacer(),
                  CustomIconTextButton(
                    onTap: widget.onAudioAtap,
                    buttonName: "Audio",
                    icon: Icon(Icons.headphones,color: Colors.white,),
                  ),
                  CustomIconTextButton(
                    onTap: widget.onVideoTap,
                    buttonName: "Video",
                    icon: Icon(Icons.tv,color: Colors.white,),
                  ),
                  CustomIconTextButton(
                    onTap: widget.onSubtitleTap,
                    buttonName: "Subtitles",
                    icon: Icon(Icons.subtitles,color: Colors.white,),
                  ),
                  Spacer(),
                  Text(widget.aspectRatioText),
                  IconButton(
                    onPressed: widget.changeAspectRatio,
                    icon: Icon(Icons.aspect_ratio,color: Colors.white,),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

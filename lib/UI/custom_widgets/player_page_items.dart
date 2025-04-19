import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/UI/custom_widgets/anime_details_page_items.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:video_player/video_player.dart';

import '../../Logic/bloc/account_cubit.dart';

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
  final VideoPlayerController controller;
  final GlobalKey<ScaffoldState> scaffoldKey;
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
    required this.episodes,
    required this.episodeIndex,
    required this.scaffoldKey
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
                          Icon(Icons.arrow_back_ios),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Episode ${widget.episodes.episodes[widget.episodeIndex].episodeNo}",
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),
                              ),
                              Text(widget.episodes.episodes[widget.episodeIndex].name)
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    widget.episodes.episodes.length > 1 ? MaterialButton(
                      onPressed: (){
                        widget.controller.pause();
                        widget.scaffoldKey.currentState!.openEndDrawer();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Icon(Icons.folder),
                          Text("Episodes"),
                        ],
                      ),
                    ):SizedBox()
                  ]
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.episodes.episodes.length > 1 ? IconButton(
                    onPressed: (){
                      widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds-10));
                    },
                    icon: Icon(Icons.replay_10,size: 50,)
                  ):SizedBox(),
                   IconButton(
                    onPressed: (){
                      setState(() {
                        hasBeenPaused = !hasBeenPaused;
                      });
                      widget.resetControlTimer;
                      widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
                    },
                    icon: Icon(widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,size: 70),
                  ),
                  widget.episodes.episodes.length > 1 ? IconButton(
                    onPressed: (){
                      widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds+10));
                    }, icon: Icon(Icons.forward_10,size: 50)
                  ):SizedBox(),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  /// Listen to controller changes and update only this Text widget
                  ValueListenableBuilder(
                    valueListenable: widget.controller,
                    builder: (context, VideoPlayerValue value, child) {
                      return Text(formatDuration(value.position));
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
                      return Text(formatDuration(value.duration));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconTextButton(
                    onTap: widget.onAudioAtap,
                    buttonName: "Audio",
                    icon: Icon(Icons.headphones),
                  ),
                  CustomIconTextButton(
                    onTap: widget.onVideoTap,
                    buttonName: "Video",
                    icon: Icon(Icons.tv),
                  ),
                  CustomIconTextButton(
                    onTap: widget.onSubtitleTap,
                    buttonName: "Subtitles",
                    icon: Icon(Icons.subtitles),
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

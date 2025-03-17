import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerControls extends StatefulWidget {
  final VideoPlayerController controller;
  const PlayerControls({super.key, required this.controller});

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {

  IconData _icon = Icons.pause;

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return hours != "00" ? "$hours:$minutes:$seconds" : "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              //Text("Episode: "),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.menu)
              ),
            ]
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){
                  widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds-10));
                },
                icon: Icon(Icons.replay_10,size: 40,)
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    widget.controller.value.isPlaying ? _icon = Icons.play_arrow : _icon = Icons.pause;
                  });
                  widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
                },
                icon: Icon(_icon,size: 50),
              ),
              IconButton(
                  onPressed: (){
                    widget.controller.seekTo(Duration(seconds: widget.controller.value.position.inSeconds+10));
                  }, icon: Icon(Icons.forward_10,size: 40)),
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
                    return Slider(
                      value: value.position.inSeconds.toDouble(),
                      min: 0,
                      max: value.duration.inSeconds.toDouble(),
                      onChanged: (newValue) {
                        widget.controller.seekTo(Duration(seconds: newValue.toInt()));
                      },
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
        ],
      )
    );
  }
}

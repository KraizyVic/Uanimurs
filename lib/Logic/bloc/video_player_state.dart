/*
part of 'video_player_cubit.dart';

abstract class VideoPlayerState {}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoaded extends VideoPlayerState {
  final VideoPlayerController controller;
  final String currentSubtitle;
  final bool isPlaying;

  VideoPlayerLoaded(this.controller, this.currentSubtitle, this.isPlaying);

  VideoPlayerLoaded copyWith({
    VideoPlayerController? controller,
    String? currentSubtitle,
    bool? isPlaying,
  }) {
    return VideoPlayerLoaded(
      controller ?? this.controller,
      currentSubtitle ?? this.currentSubtitle,
      isPlaying ?? this.isPlaying,
    );
  }
}

class Subtitle {
  final int startTime;
  final int endTime;
  final String text;

  Subtitle({required this.startTime, required this.endTime, required this.text});
}
*/

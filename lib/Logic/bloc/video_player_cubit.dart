/*
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:http/http.dart' as http;

part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  late VideoPlayerController _controller;
  Timer? _subtitleTimer;

  VideoPlayerCubit() : super(VideoPlayerInitial());

  /// Initialize Video Player
  Future<void> initializeVideoPlayer(String videoUrl, String subtitleUrl) async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    await _controller.initialize();
    emit(VideoPlayerLoaded(_controller, "", false));

    _controller.play();
    _controller.addListener(_onPlaybackStateChange);

    _fetchSubtitles(subtitleUrl);
  }

  /// Handle Play/Pause and WakeLock
  void _onPlaybackStateChange() {
    final isPlaying = _controller.value.isPlaying;

    if (isPlaying) {
      WakelockPlus.enable();
    } else {
      WakelockPlus.disable();
    }

    emit((state as VideoPlayerLoaded).copyWith(isPlaying: isPlaying));
  }

  /// Fetch Subtitles
  Future<void> _fetchSubtitles(String subtitleUrl) async {
    final response = await http.get(Uri.parse(subtitleUrl));

    if (response.statusCode == 200) {
      final subtitles = _parseVTT(response.body);
      _startSubtitleSync(subtitles);
    }
  }

  /// Parse VTT
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

  /// Sync subtitles with video playback
  void _startSubtitleSync(List<Subtitle> subtitles) {
    _subtitleTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (!_controller.value.isPlaying) return;
      final position = _controller.value.position.inMilliseconds;
      final matchingSub = subtitles.firstWhere(
            (sub) => position >= sub.startTime && position <= sub.endTime,
        orElse: () => Subtitle(startTime: 0, endTime: 0, text: ''),
      );

      if ((state as VideoPlayerLoaded).currentSubtitle != matchingSub.text) {
        emit((state as VideoPlayerLoaded).copyWith(currentSubtitle: matchingSub.text));
      }
    });
  }

  /// Seek video position
  void seekTo(Duration position) {
    _controller.seekTo(position);
  }

  /// Dispose resources
  @override
  Future<void> close() {
    _controller.dispose();
    _subtitleTimer?.cancel();
    return super.close();
  }
}
*/

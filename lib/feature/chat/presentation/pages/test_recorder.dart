// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../services/audio_service/audio_player.dart';
import '../../../../services/audio_service/audio_recorder.dart';

class TestRecorder extends StatefulWidget {
  static const routeName = '/test_recorder';

  const TestRecorder({
    Key? key,
  }) : super(key: key);

  @override
  State<TestRecorder> createState() => _TestRecorderState();
}

class _TestRecorderState extends State<TestRecorder> {
  bool showPlayer = false;
  String? audioPath;

  @override
  void initState() {
    showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (showPlayer && audioPath is String)
        ? AudioPlayerWidget(
            source: audioPath!,
            onDelete: () {
              setState(() => showPlayer = false);
            },
          )
        : Recorder(
            onStop: (path) {
              if (kDebugMode) print('Recorded file path: $path');
              setState(() {
                audioPath = path;
                showPlayer = true;
              });
            },
          );
  }
}

class AudioVisualizerPainter extends CustomPainter {
  final List<int> audioSamples;

  AudioVisualizerPainter(this.audioSamples);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Path path = Path();
    final double width = size.width / audioSamples.length;

    path.moveTo(0, size.height / 2);

    for (int i = 0; i < audioSamples.length; i++) {
      final double sample = audioSamples[i].toDouble();
      final double x = i * width;
      final double y = size.height / 2 + sample / 256 * (size.height / 2);

      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

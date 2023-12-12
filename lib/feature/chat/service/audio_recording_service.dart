import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecordingService {
  late AudioRecorder _audioRecorder;
  late String _filePath;

  AudioRecordingService() {
    _audioRecorder = AudioRecorder();
  }

  Future<void> initialize() async {
    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {

  }

  Future<String?> startRecording() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      _filePath = '${tempDir.path}/audio_recording.wav';

      await _audioRecorder.start(
        RecordConfig(),
        path: _filePath,
      );

      return _filePath;
    } catch (e) {
      print('Error starting audio recording: $e');
      return null;
    }
  }

  Future<String?> stopRecording() async {
    try {
      await _audioRecorder.stop();
      return _filePath;
    } catch (e) {
      print('Error stopping audio recording: $e');
      return null;
    }
  }
}

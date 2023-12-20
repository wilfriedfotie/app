import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class AudioRecordingService {
  late AudioRecorder _audioRecorder;
  late String _filePath;

  AudioRecordingService() {
    _audioRecorder = AudioRecorder();
  }

  Future<void> initialize() async {
    await requestPermissions();
  }

  Future<bool> getStatus() async {
    return Permission.microphone.status.isGranted;
  }

  Future<void> requestPermissions() async {
    await Permission.microphone.request();
    await Permission.manageExternalStorage.request();
  }



    Future<String?> startRecording() async {
    try {
      Directory tempDir;

      if (Platform.isIOS) {
        tempDir = await getApplicationDocumentsDirectory();
      } else {
        tempDir = (await getExternalStorageDirectory())!;
      }
      _filePath = '${tempDir.path + DateTime.now().millisecondsSinceEpoch.toString()}/audio_recording.wav';

      await _audioRecorder.start(
        RecordConfig(),
        path: _filePath,
      );

      print(_filePath);

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

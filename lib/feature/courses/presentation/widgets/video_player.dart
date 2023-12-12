import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  final String link;
  const VideoApp({
    super.key,
    required this.link,
  });

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.link))
          ..initialize().then((_) {
            videoPlayerController.play();
            setState(() {});
          });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void didUpdateWidget(covariant VideoApp oldWidget) {
    if ((chewieController?.isPlaying ?? false)) {
      videoPlayerController.pause();
      return;
    }

    if (widget.link != oldWidget.link) {
      videoPlayerController.dispose();
      chewieController?.dispose();
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.link))
            ..initialize().then((_) {
              videoPlayerController.play();

              setState(() {});
            });

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false,
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: Chewie(
              controller: chewieController!,
            ),
          )
        : Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}

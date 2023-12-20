import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/rendering.dart';

enum StatusType { video, photo }

class StatusWidget extends StatefulWidget {
  final String link;
  final StatusType type;
  final AnimationController animationController;
  final bool showStart, isPaused;
  final Function() handleNext, handlePrev;

  const StatusWidget({
    super.key,
    required this.link,
    required this.animationController,
    this.type = StatusType.video,
    this.showStart = true,
    this.isPaused = false,
    required this.handleNext,
    required this.handlePrev,
  });

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    if (widget.type == StatusType.video) {
      _initiateVideo();
    }
  }

  nothing() {
    if (widget.animationController.status != AnimationStatus.forward) {
      widget.animationController.reset();
      widget.animationController.forward();
    }
  }

  // @override
  // void didUpdateWidget(covariant StatusWidget oldWidget) {
  //   if (widget.type == StatusType.video) {
  //     _updateVideo(oldWidget);
  //   }

  //   super.didUpdateWidget(oldWidget);
  // }

  Widget _videoWidget() => videoPlayerController.value.isInitialized
      ? Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onLongPressStart: (val) {
                    widget.animationController.stop();
                    videoPlayerController.pause();
                  },
                  onLongPressEnd: (val) {
                    widget.animationController.forward();
                    videoPlayerController.play();
                  },
                  child: Center(
                      child: AspectRatio(
                          aspectRatio: videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(videoPlayerController)))),
            ),
            Positioned(
                child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        widget.handlePrev();
                      },
                      child: Container(),
                    )),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        widget.handleNext();
                      },
                      child: Container(),
                    )),
              ],
            ))
          ],
        )
      : Center(
          child: CircularProgressIndicator(),
        );

  Widget _photoWidget() => CachedNetworkImage(
      imageUrl: widget.link,
      imageBuilder: (context, imageProvider) {
        return MeasureSize(
            onChange: (size) {
              if (size.height > 0) {
                nothing();
              }
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onLongPressStart: (val) {
                        widget.animationController.stop();
                      },
                      onLongPressEnd: (val) {
                        widget.animationController.forward();
                      },
                      child: Image(image: imageProvider)),
                ),
                Positioned(
                    child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            widget.handlePrev();
                          },
                          child: Container(),
                        )),
                    Spacer(
                      flex: 8,
                    ),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            widget.handleNext();
                          },
                          child: Container(),
                        )),
                  ],
                ))
              ],
            ));
      },
      errorWidget: (context, val, progress) => Icon(Icons.error),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        print(downloadProgress.downloaded);
        return Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        );
      });

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      StatusType.video => _videoWidget(),
      StatusType.photo => _photoWidget(),
    };
  }

  void _initiateVideo() {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.link))
          ..addListener(() {
            if (videoPlayerController.value.position >
                    const Duration(seconds: 0) &&
                widget.animationController.status != AnimationStatus.forward &&
                widget.showStart) {
              widget.animationController.reset();
              widget.animationController.forward();
            }
          })
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

  void _updateVideo(StatusWidget oldWidget) {
    if (widget.isPaused && (chewieController?.isPlaying ?? false)) {
      videoPlayerController.pause();
      return;
    }

    if (widget.link != oldWidget.link) {
      videoPlayerController.dispose();
      chewieController?.dispose();
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.link))
            ..addListener(() {
              if (videoPlayerController.value.position >
                      const Duration(seconds: 0) &&
                  widget.animationController.status !=
                      AnimationStatus.forward &&
                  widget.showStart) {
                widget.animationController.reset();
                widget.animationController.forward();
              }
            })
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
  }

  @override
  void dispose() {
    if (widget.type == StatusType.video) {
      videoPlayerController.dispose();
      chewieController?.dispose();
    }
    super.dispose();
  }
}

typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

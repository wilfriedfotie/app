import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../core/components/styling.dart';
import '../feature/status/presentation/widget/status_widget.dart';

class StatusPage extends StatefulWidget {
  static const String routePage = "/statusPage";

  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  double _actualValue = 0.0;
  int _currentStatus = 0;
  List<String> imageUrls = [
    "https://www.shutterstock.com/image-photo/cheerful-black-man-wearing-leather-260nw-2238222273.jpg",
    "https://media.istockphoto.com/id/1301253705/photo/studio-portrait-of-a-man-in-a-suit.jpg?s=612x612&w=0&k=20&c=qPEvWSUC6u_APo5xw097cM50-_a7miciLDy2DdW7JKc=",
    "https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4=",
    "https://www.shutterstock.com/image-photo/cheerful-black-man-wearing-leather-260nw-2238222273.jpg",
    "https://media.istockphoto.com/id/1301253705/photo/studio-portrait-of-a-man-in-a-suit.jpg?s=612x612&w=0&k=20&c=qPEvWSUC6u_APo5xw097cM50-_a7miciLDy2DdW7JKc=",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
  ];

  List<String> videoUrls = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
  ];

  int totalItems = 3, currentItem = 1;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(milliseconds: 1), (Timer t) {
      if (_actualValue == 100) {
        _stopTimer();
        if (_currentStatus <= imageUrls.length - 1) {
          setState(() => _currentStatus++);

          _loadNext();
        }
      } else {
        setState(() => _actualValue++);
      }
    });
  }

  void _loadNext() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeInCubic);
    _startTimer();
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _actualValue = 0);
  }

  // @override
  // void didUpdateWidget(covariant StatusPage oldWidget) {
  //   setState(() {
  //     _actualValue = 0.0;
  //     _currentStatus = 0;
  //   });
  //   _pageController.jumpToPage(0);
  //   _startTimer();
  //
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void initState() {
    // _startTimer();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        handleNextElt();
      }
    });

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    super.initState();
  }

  handleNextElt() {
    if (_currentStatus < imageUrls.length - 1) {
      _animationController.reset();
      setState(() => _currentStatus++);

      _pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeInCubic);
    }
  }

  handlePrevElt() {
    if (_currentStatus > 0) {
      _animationController.reset();
      setState(() => _currentStatus--);

      _pageController.previousPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeInCubic);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              ...List.generate(
                imageUrls.length,
                (index) => Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      height: 9,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return LinearProgressIndicator(
                                  value: index == _currentStatus
                                      ? _animation.value
                                      : index < _currentStatus
                                          ? 1
                                          : 0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppTheme.primaryColor,
                                  ),
                                  backgroundColor: HexColor("#E5E5E5"),
                                );
                              }))),
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            // ...imageUrls.map(
            //   (e) => CachedNetworkImage(
            //
            //     imageUrl: e,
            //       errorWidget: (context, val, progress) => Icon(Icons.error),
            //       progressIndicatorBuilder: (context, url, downloadProgress) =>
            //           Center(child: CircularProgressIndicator(value: downloadProgress.progress))
            //   ),
            // )
            ...imageUrls.map((e) => StatusWidget(
                  animationController: _animationController,
                  handleNext: handleNextElt,
                  handlePrev: handlePrevElt,
                  type: e == imageUrls[5] ? StatusType.video : StatusType.photo,
                  link: e,
                ))
          ],
        ));
  }
}

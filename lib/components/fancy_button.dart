import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final Duration duration;
  final VoidCallback onPressed;
  final double size;
  final int? counter;
  final Color? counterColor;

  const FancyButton(
      {Key? key,
      required this.child,
      required this.size,
      required this.color,
      required this.duration,
      required this.onPressed,
      this.counter,
      this.counterColor})
      : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 160),
  );
  late Animation<double> _pressedAnimation;

  late TickerFuture _downTicker;

  double get buttonDepth => widget.size * 0.2;

  void _setupAnimation() {
    _animationController.stop();
    final oldControllerValue = _animationController.value;
    _animationController.dispose();
    _animationController = AnimationController(
      duration: Duration(microseconds: widget.duration.inMicroseconds ~/ 2),
      vsync: this,
      value: oldControllerValue,
    );
    _pressedAnimation = Tween<double>(begin: -buttonDepth, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void initState() {
    _setupAnimation();
    super.initState();
  }

  @override
  void didUpdateWidget(FancyButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _setupAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setupAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    if (widget.onPressed != null) {
      _downTicker = _animationController.animateTo(1.0);
    }
  }

  void _onTapUp(_) {
    if (widget.onPressed != null) {
      _downTicker.whenComplete(() {
        _animationController.animateTo(0.0);
        widget.onPressed.call();
      });
    }
  }

  void _onTapCancel() {
    if (widget.onPressed != null) {
      _animationController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final vertPadding = widget.size * 0.25;
    final horzPadding = widget.size * 0.50;
    final radius = BorderRadius.circular(horzPadding * 30);

    return Container(
      padding: EdgeInsets.only(bottom: 2, left: 0.5, right: 0.5),
      height: 60,
      decoration: BoxDecoration(
        //color: Colors.black87,
        color: AppTheme.grayColor,
        borderRadius: radius,
      ),
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: _hslRelativeColor(s: -0.20, l: -0.20), //l =-0.20
                    borderRadius: radius,
                  ),
                ),
                AnimatedBuilder(
                  animation: _pressedAnimation,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset(0.0, _pressedAnimation.value),
                      child: child,
                    );
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: radius,
                        child: Stack(
                          children: <Widget>[
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: _hslRelativeColor(),
                                borderRadius: radius,
                              ),
                              child: SizedBox.expand(),
                            ),
                            Transform.translate(
                              offset: Offset(0.0, vertPadding * 2),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: _hslRelativeColor(),
                                  borderRadius: radius,
                                ),
                                child: SizedBox.expand(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: vertPadding,
                          horizontal: horzPadding,
                        ),
                        child: widget.child,
                      ),
                      Visibility(
                        visible: widget.counter != null,
                        child: Positioned(
                          top: -10,
                          right: 0,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    widget.counterColor ?? AppTheme.errorColor),
                            alignment: Alignment.center,
                            child: Text(
                              "${widget.counter ?? 0}",
                              style: TextStyle(color: AppTheme.whiteColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _hslRelativeColor({double h = 0.0, s = 0.0, l = 0.0}) {
    final hslColor = HSLColor.fromColor(widget.color);
    h = (hslColor.hue + h).clamp(0.0, 360.0);
    s = (hslColor.saturation + s).clamp(0.0, 2.0);
    l = (hslColor.lightness + l).clamp(0.0, 1.0);
    return HSLColor.fromAHSL(hslColor.alpha, h, s, l).toColor();
  }
}

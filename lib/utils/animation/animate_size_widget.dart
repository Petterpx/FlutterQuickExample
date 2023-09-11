import 'package:flutter/cupertino.dart';

class AnimateSizeWidget extends StatefulWidget {
  Widget child;
  Duration? duration;
  Curve? curve;
  bool toDown;

  AnimateSizeWidget(
      {super.key,
      required this.child,
      this.duration,
      this.curve,
      this.toDown = true});

  @override
  State<AnimateSizeWidget> createState() => _AnimateSizeWidgetState();
}

class _AnimateSizeWidgetState extends State<AnimateSizeWidget>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late CurvedAnimation _curved;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: widget.duration ?? Duration(milliseconds: 300));
    _curved = CurvedAnimation(
        curve: widget.curve ?? Curves.linear, parent: _controller);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    startAnimation();
  }

  @override
  void didUpdateWidget(covariant AnimateSizeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    startAnimation();
  }

  void startAnimation() {
    if (widget.toDown) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: _animation,
        child: widget.child,
        axis: Axis.vertical,
        axisAlignment: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _curved.dispose();
  }
}

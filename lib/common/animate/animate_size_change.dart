import 'package:flutter/material.dart';

/// 可以实现放大和缩小的动画
class AnimateSizeChanged extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double sizePercentStartValue;
  final double sizePercentEndValue;
  final double opacityBeginValue;
  final double opacityEndValue;

  AnimateSizeChanged({
    key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.sizePercentStartValue = 0.0,
    this.sizePercentEndValue = 1.0,
    this.opacityBeginValue = 0.0,
    this.opacityEndValue = 1.0,
  }) : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  _AnimateSizeChangedState createState() => _AnimateSizeChangedState();
}

class _AnimateSizeChangedState extends State<AnimateSizeChanged>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> sizeChanged;
  late Animation<double> opacity;

  @override
  void dispose() {
    disposed = true;
    controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    sizeChanged = Tween(
            begin: widget.sizePercentStartValue,
            end: widget.sizePercentEndValue)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    opacity = Tween<double>(
            begin: widget.opacityBeginValue, end: widget.opacityEndValue)
        .animate(CurvedAnimation(
            parent: controller!, curve: const Interval(0, 0.65)));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
        animation: sizeChanged,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: sizeChanged.value,
            child: Opacity(
              opacity: opacity.value,
              child: widget.child,
            ),
          );
        });
  }
}

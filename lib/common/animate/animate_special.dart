import 'package:flutter/material.dart';

/// 果冻Q弹效果
class AnimateJelloIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  AnimateJelloIn(
      {key,
        required this.child,
        this.duration = const Duration(milliseconds: 800),
        this.delay = const Duration(milliseconds: 0),
        this.controller,
        this.manualTrigger = false,
        this.animate = true})
      : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  _AnimateJelloInState createState() => _AnimateJelloInState();
}

class _AnimateJelloInState extends State<AnimateJelloIn> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> rotation;
  late Animation<double> opacity;

  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    rotation = Tween<double>(begin: 1.5, end: 0.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.bounceOut));

    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0, 0.65)));

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
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(0, 0, rotation.value + 1)
                ..rotateX(rotation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

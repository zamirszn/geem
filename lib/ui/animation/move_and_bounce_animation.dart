import 'package:flutter/material.dart';

class MoveAndBouneAnimation extends StatefulWidget {
  const MoveAndBouneAnimation(
      {Key? key,
      required this.child,
      required this.dx,
      required this.dy,
      required this.dx2,
      required this.dy2,
      required this.milliseconds})
      : super(key: key);
  final Widget child;
  final double dx;
  final double dy;
  final double dx2;
  final double dy2;
  final int milliseconds;

  @override
  State<MoveAndBouneAnimation> createState() => _MoveAndBouneAnimationState();
}

class _MoveAndBouneAnimationState extends State<MoveAndBouneAnimation>
    with TickerProviderStateMixin {
  AnimationController? bounceController;

  Animation? bounceAnimation;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    bounceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bouncingWidgetContainer(),
    );
  }

  Widget bouncingWidgetContainer() {
    return Transform.translate(
      offset: bounceAnimation?.value,
      child: widget.child,
    );
  }

  void startAnimation() {
    bounceController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));
    bounceAnimation = Tween(
            begin: Offset(widget.dx, widget.dy),
            end: Offset(widget.dx2, widget.dy2))
        .animate(bounceController!);

    bounceController?.addListener(() => setState(() {}));
    bounceController?.forward();

    bounceController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bounceController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        bounceController?.forward(from: 0.0);
      }
    });
  }
}

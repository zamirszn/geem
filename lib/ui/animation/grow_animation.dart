import 'package:flutter/cupertino.dart';

class GrowAnimation extends StatefulWidget {
  const GrowAnimation(
      {Key? key, required this.child, required this.milliseconds})
      : super(key: key);
  final Widget child;
  final int milliseconds;

  @override
  State<GrowAnimation> createState() => _GrowAnimationState();
}

class _GrowAnimationState extends State<GrowAnimation>
    with TickerProviderStateMixin {
  AnimationController? growController;
  Animation? growAnimation;
  double? scale;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    growController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scale = 1 - growController!.value;
    return Container(
      child: growWidget(),
    );
  }

  Widget growWidget() {
    return AnimatedBuilder(
      animation: growController!,
      builder: (context, child) {
        return Transform.scale(
          scale: scale,
          child: widget.child,
        );
      },
    );
  }

  void startAnimation() {
    growController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.milliseconds),
        lowerBound: 0.0,
        upperBound: 0.09);
    growAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: growController!, curve: const Interval(0.4, 1.0)));
    growController?.addListener(() => setState(() {}));
    growController?.forward();

    // Future.delayed(const Duration(seconds: 2), () {
    //   growController?.reverse();
    // });
    growController?.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await growController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        growController?.forward(from: 0.0);
      }
    });
  }
}

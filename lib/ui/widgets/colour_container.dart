import 'package:flutter/material.dart';

class ColourContainer extends StatefulWidget {
  const ColourContainer(
      {Key? key, required this.child, required this.gradientColor})
      : super(key: key);
  final Widget child;
  final List<Color> gradientColor;

  @override
  State<ColourContainer> createState() => _ColourContainerState();
}

class _ColourContainerState extends State<ColourContainer> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => setState(() {
        
    //   }),
    // );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.gradientColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
      ),
      child: widget.child,
    );
  }
}

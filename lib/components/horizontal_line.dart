import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
    required this.width,
    this.thickness = 1,
    this.lineColor = Colors.grey,
  }) : super(key: key);

  final double width;
  final double thickness;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: thickness,
      color: Colors.white,
    );
  }
}

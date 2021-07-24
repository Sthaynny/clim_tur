import 'package:clim_tur/core/ui/dimension_screen.dart';
import 'package:flutter/material.dart';

class TitleCenterWidget extends StatelessWidget {
  const TitleCenterWidget({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.padding,
  }) : super(key: key);
  final String title;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

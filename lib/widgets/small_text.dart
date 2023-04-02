import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';

class SmallText extends StatelessWidget {
  TextAlign? align;
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({Key? key,
    this.color = AppTheme.mainTextColor,
    required this.text,
    this.size = 20,
    this.height = 1.2,
    this.align = TextAlign.start
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: height,
      ),
    );
  }
}
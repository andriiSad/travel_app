import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton({
    super.key,
    this.isIcon = false,
    this.text = '',
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: isIcon == false
            ? AppText(
                text: text!,
                color: color,
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}

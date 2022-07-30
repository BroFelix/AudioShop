import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
    required this.height,
    required this.width,
    required this.onPressed,
    this.text,
    this.child,
    this.padding,
  }) : super(key: key);

  final double height;
  final double width;
  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      height: height,
      minWidth: width,
      color: Colors.green[300],
      child:child?? Text(
        text??'',
        style: AppTextStyle.buttonText.copyWith(color: AppColors.white),
      ),
      onPressed: onPressed,
    );
  }
}

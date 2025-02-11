import 'package:flutter/material.dart';
import 'package:mr_book/core/utlis/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.bgColor,required this.textColor,this.borderRadius, this.fontWeight, this.onPressed,});
  final String text;
  final Color textColor;
  final Color bgColor;
  final FontWeight ? fontWeight;
  BorderRadius ? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return   TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: secondColor),
          borderRadius: borderRadius??BorderRadius.circular(10),
        ),
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: textColor,
            fontWeight: fontWeight
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const PrimaryButton({super.key, required this.label, required this.onPressed, this.buttonColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Color(0xFF0E4A62),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Text(
          label,
          style:  TextStyle(color: textColor ??  Colors.white, letterSpacing: 1.2,fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
    );
  }
}
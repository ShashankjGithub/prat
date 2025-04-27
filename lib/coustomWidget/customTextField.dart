import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/themeConfig.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController clt;
  String? Function(String?)? validator;

   CustomTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false, required this.clt,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: mainColor.withAlpha(20),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: mainColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              controller: clt,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.black),
              ),
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}


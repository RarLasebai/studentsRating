import 'package:flutter/material.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 39.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r), color: primary),
          child: Center(child: TxtStyle(text, 12, Colors.white, FontWeight.normal))),
    );
  }
}

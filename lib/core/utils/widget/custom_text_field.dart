import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const CustomTextField(this.hint, {this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 47.h,
        width: 198.w,
        decoration: BoxDecoration(
            border: Border.all(color: darkGrey),
            borderRadius: BorderRadius.circular(15.r),
            color: softGrey),
        child: Center(
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(14),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "من فضلك لا تترك الحقل فارغاً";
              } else {
                return null;
              }
            },
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: const BorderSide(color: Colors.transparent)),
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: 'Cairo',
                    color: darkGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.r))),
          ),
        ),
      ),
    );
  }
}

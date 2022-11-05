import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';

// ignore: must_be_immutable
class TopNavBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  final double titleSize;
  @override
  final Size preferredSize;
  TopNavBar(this._title, {Key? key, this.titleSize = 15})
      : preferredSize = Size.fromHeight(39.0.h),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 4,
      backgroundColor: Colors.white,
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/week_star.png"),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TxtStyle(
                _title,
                titleSize,
                Colors.black,
                FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}

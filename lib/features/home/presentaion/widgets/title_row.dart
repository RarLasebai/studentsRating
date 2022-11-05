import 'package:flutter/material.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 8),
          child: titleAndDivider("الاسم"),
        ),
        titleAndDivider("الدرجة"),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: titleAndDivider("التقييـم"),
        ),
        titleAndDivider("التراكمي"),
      ],
    );
  }

  Widget titleAndDivider(String title) {
    return Column(
      children: [
        TxtStyle(title, 14, Colors.black, FontWeight.bold),
        Image.asset(
          "assets/Line.png",
          color: Colors.white,
        )
      ],
    );
  }
}

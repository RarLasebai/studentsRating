import 'package:flutter/material.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';

class WeekTitleRow extends StatelessWidget {
  const WeekTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        titleAndDivider("الاسم"),
        titleAndDivider("الدرجة"),
      ],
    );
  }

  Widget titleAndDivider(String title) {
    return Column(
      children: [
        TxtStyle(title, 14, Colors.black, FontWeight.bold),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset("assets/Line.png"),
        )
      ],
    );
  }
}

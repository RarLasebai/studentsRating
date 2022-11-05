import 'package:flutter/material.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/popups/screens/star_pop_up.dart';

import '../../../home/domain/entites/student.dart';

// ignore: must_be_immutable
class WeekStudentRow extends StatelessWidget {
  Student student;
  WeekStudentRow(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () => StarPopUp.show(context, "الأسبوع", student: student),
            child: titleAndDivider(student.studentName!)),
        gradeAndDivider(
            student.studentWeekGrade == null ? 0 : student.studentWeekGrade!),
      ],
    );
  }

  Widget titleAndDivider(String title) {
    return Column(
      children: [
        TxtStyle(title, 14, veryGood, FontWeight.bold),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset("assets/Line.png"),
        )
      ],
    );
  }

  Widget gradeAndDivider(double grade) {
    // Color rate = veryGood;
    // if (grade > 84 && grade < 101) {
    //   rate = excellent;
    // } else if (grade > 74 && grade < 85) {
    //   rate = veryGood;
    // } else if (grade > 64 && grade < 75) {
    //   rate = good;
    // } else {
    //   rate = bad;
    // }
    return Column(
      children: [
        TxtStyle(grade.toString(), 14, veryGood, FontWeight.bold),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset("assets/Line.png"),
        )
      ],
    );
  }
}

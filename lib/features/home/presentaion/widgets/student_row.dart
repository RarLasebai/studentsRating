import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';
import 'package:students_rating/features/popups/screens/add_grade_pop_up.dart';

import '../../../popups/screens/student_pop_up.dart';

// ignore: must_be_immutable
class StudentRow extends StatefulWidget {
  Student student;
  BuildContext contextt;
  StudentRow(this.student, {super.key, required this.contextt});

  @override
  State<StudentRow> createState() => _StudentRowState();
}

class _StudentRowState extends State<StudentRow> {
  @override
  Widget build(c) {
    String rate = "";
    Color rateColor,
        riotColor = widget.student.isriot == 1 ? bad : Colors.black;
    double grade = widget.student.studentGrade!.toDouble();

    if (grade > 84 && grade < 101) {
      rateColor = excellent;
      rate = "ممتاز";
    } else if (grade > 74 && grade < 85) {
      rateColor = veryGood;
      rate = "جيد جداً";
    } else if (grade > 64 && grade < 75) {
      rateColor = good;
      rate = "جيد";
    } else {
      rateColor = bad;
      rate = "ضعيف";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: GestureDetector(
                onTap: () => StudentPopUp.show(widget.contextt, false,
                    studentModel: widget.student),
                child: titleAndDivider(widget.student.studentName!, riotColor,
                    isNote: true))),
        GestureDetector(
          onTap: () {
            AddGradePopUp.show(context, widget.student);
          },
          child: titleAndDivider("${widget.student.studentGrade!}",
              riotColor == bad ? riotColor : rateColor,
              isGrade: true),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:
              titleAndDivider(rate, riotColor == bad ? riotColor : rateColor),
        ),
        titleAndDivider(
            widget.student.studentWeekGrade == null
                ? "0"
                : "${widget.student.studentWeekGrade!}",
            riotColor),
      ],
    );
  }

  Widget titleAndDivider(String title, Color color,
      {bool? isGrade = false, isNote = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/Line.png"),
        SizedBox(height: 8.h),
        isGrade == true
            ? Row(
                children: [
                  TxtStyle(title, 11, color, FontWeight.bold),
                  SizedBox(width: 7.w),
                  Image.asset("assets/add.png")
                ],
              )
            : TxtStyle(title, 11, color, FontWeight.bold),
        isNote == true && widget.student.studentNote != null
            ? TxtStyle(
                widget.student.studentNote!, 11, darkGrey, FontWeight.normal)
            : TxtStyle(widget.student.studentNote!, 11, Colors.white,
                FontWeight.normal)
      ],
    );
  }
}

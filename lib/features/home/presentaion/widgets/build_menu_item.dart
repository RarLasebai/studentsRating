import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_rating/core/functions/print_page.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/data/model/student_model.dart';
import 'package:students_rating/features/home/presentaion/screens/home_screen.dart';
import 'package:students_rating/features/weekRating/presentation/screens/week_rating_screen.dart';

import '../../../popups/screens/student_pop_up.dart';

class BuildMenuItem extends StatelessWidget {
  StudentModel studentModel = StudentModel();

  BuildMenuItem(this.studentModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<StudentsBloc>(context),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Wrap(
          children: [
            ListTile(
              leading: Image.asset("assets/day_star.png"),
              title: const TxtStyle(
                  "التقييم اليومي", 14, Colors.white, FontWeight.bold),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  HomeScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Image.asset(
                "assets/week_star.png",
                color: Colors.white,
              ),
              title: const TxtStyle(
                  "التقييم الأسبوعي", 14, Colors.white, FontWeight.bold),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => WeekRatingScreen(context)));
              },
            ),
            ListTile(
              leading: Image.asset("assets/add_student.png"),
              title: const TxtStyle(
                  "إضافة طالب", 14, Colors.white, FontWeight.bold),
              onTap: () {
                StudentPopUp.show(context, true, studentModel: studentModel)
                    .then((value) {
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore_outlined, color: Colors.white),
              title: const TxtStyle(
                  "تصفير الدرجات", 14, Colors.white, FontWeight.bold),
              onTap: () {
                BlocProvider.of<StudentsBloc>(context).add(ResetGradesEvent());
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.white),
              title: const TxtStyle(
                  "مشاركة كمستند", 14, Colors.white, FontWeight.bold),
              onTap: () {
                printScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_rating/core/utils/widget/top_nav_bar.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_states.dart';
import 'package:students_rating/features/home/presentaion/screens/navigation_drawer.dart';
import 'package:students_rating/features/weekRating/presentation/widgets/week_student_row.dart';
import 'package:students_rating/features/weekRating/presentation/widgets/week_title_row.dart';

import '../../../../core/utils/colors/colors.dart';
import '../../../home/domain/entites/student.dart';

// ignore: must_be_immutable
class WeekRatingScreen extends StatelessWidget {
  BuildContext superContext;
  WeekRatingScreen(this.superContext, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Student>? students;
    var bloc = superContext.read<StudentsBloc>()..add(GetWeekGradesEvent());
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider.value(
            value: BlocProvider.of<StudentsBloc>(superContext)
              ..add(GetWeekGradesEvent()),
            child: Scaffold(
                appBar: TopNavBar("التقييم الأسبوعي"),
                drawer: const NavigationDrawer(),
                body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: BlocConsumer<StudentsBloc, StudentsStates>(
                        listener: (context, state) {
                      if (state is StudentErrorState) {
                        const Icon(Icons.error);
                      }
                    }, builder: (context, studentState) {
                      if (studentState is WeekGradesLoadedState) {
                        students = studentState.students;
                        return Stack(
                          children: [
                            const Positioned(
                                bottom: 0,
                                left: 22,
                                child: Center(
                                  child: TxtStyle(
                                      "اضغط على الطالب المرشح من قبلك ليكون نجم الأسبوع!",
                                      12,
                                      darkGrey,
                                      FontWeight.normal),
                                )),
                            ListView(
                              children: [
                                const WeekTitleRow(),
                                ...students!
                                    .map((student) =>
                                        WeekStudentRow(student, bloc))
                                    .toList(),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(color: primary));
                      }
                    })))));
  }
}

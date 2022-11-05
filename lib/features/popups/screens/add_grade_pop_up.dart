import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/custom_button.dart';
import 'package:students_rating/core/utils/widget/custom_text_field.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_states.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';

class AddGradePopUp {
  static Future<dynamic> show(context, Student student) async {
    TextEditingController gradeController = TextEditingController();

    return await showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => StudentsBloc(),
            child: BlocConsumer<StudentsBloc, StudentsStates>(
              listener: (context, state) {
                if (state is StudentErrorState) {
                  const Icon(Icons.error);
                }
              },
              builder: (context, state) {
                if (state is StudentsLoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: 280.w,
                      height: 215.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TxtStyle("إضافة درجة اليوم", 15, Colors.black,
                              FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 30),
                            child: CustomTextField("أدخل درجة اليوم",
                                controller: gradeController),
                          ),
                          CustomButton("حفظ", () {
                            StudentsBloc().add(ClacWeekGradeEvent(
                                student.studentId!,
                                double.parse(gradeController.text),
                                student.studentWeekGrade == null
                                    ? 0
                                    : student.studentWeekGrade!));
                           
                            Navigator.pop(context, true);
                          })
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          );
        });
  }
}

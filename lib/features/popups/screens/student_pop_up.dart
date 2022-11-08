import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/custom_button.dart';
import 'package:students_rating/core/utils/widget/custom_text_field.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_states.dart';
import 'package:students_rating/features/home/data/model/student_model.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';
import '../../home/application/HomeBloc/students_bloc.dart';

class StudentPopUp {
  static Future<dynamic> show(superContext, isNewStudent,
      {Student? studentModel}) async {
    TextEditingController name = TextEditingController();
    // TextEditingController grade = TextEditingController();
    TextEditingController note = TextEditingController();
    bool? isRiot = studentModel!.isriot == 1 ? true : false;
    return await showDialog(
        context: superContext,
        builder: (_) {
          return BlocProvider.value(
            value: BlocProvider.of(superContext),
            //value: superContext.read<StudentsBloc>(),
            child: BlocConsumer<StudentsBloc, StudentsStates>(
              listener: (context, state) {
                if (state is StudentErrorState) {
                  const Icon(Icons.error);
                }
              },
              builder: (context, state) {
                if (state is StudentsLoadingState) {
                  return const CircularProgressIndicator();
                }
                return StatefulBuilder(builder: (context, setState) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: 280.w,
                      height: 300.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          TxtStyle(
                              isNewStudent == true
                                  ? "إضافة طالب جديد"
                                  : "تعديل طالب ",
                              15,
                              Colors.black,
                              FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 10),
                            child: CustomTextField(
                                isNewStudent == true
                                    ? "اسم الطالب"
                                    : "${studentModel.studentName}",
                                controller: name),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 12),
                            child: CustomTextField(
                                studentModel.studentNote == null
                                    ? "إضافة ملاحظة"
                                    : "${studentModel.studentNote}",
                                controller: note),
                          ),
                          isNewStudent == false
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TxtStyle(
                                        "مشاغب", 14, bad, FontWeight.normal),
                                    Checkbox(
                                        value: isRiot,
                                        activeColor: primary,
                                        onChanged: (v) {
                                          setState((() {
                                            isRiot = v;
                                          }));
                                        }),
                                  ],
                                )
                              : Container(),
                          CustomButton(
                              isNewStudent == true ? "إضافة" : "حفظ",
                              isNewStudent == true
                                  ? () {
                                      StudentModel newStudent = StudentModel(
                                          studentName: name.text,
                                          studentGrade: 0,
                                          studentNote: note.text,
                                          isriot: 0);
                                      StudentsBloc()
                                          .add(AddStudentEvent(newStudent));
                                      StudentsBloc().added = true;
                                      Navigator.pop(context);
                                    }
                                  : () {
                                      StudentModel updatedStudent =
                                          StudentModel(
                                              studentName: name.text.isEmpty
                                                  ? studentModel.studentName
                                                  : name.text,
                                              studentGrade:
                                                  studentModel.studentGrade,
                                              studentNote: note.text.isEmpty
                                                  ? studentModel.studentNote
                                                  : note.text,
                                              studentId: studentModel.studentId,
                                              studentWeekGrade:
                                                  studentModel.studentWeekGrade,
                                              isriot: isRiot == true ? 1 : 0);
                                      setState(() {
                                        StudentsBloc().add(
                                            UpdateStudentEvent(updatedStudent));
                                        StudentsBloc().add(GetStudentsEvent());
                                        Navigator.pop(context);
                                      });
                                    })
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          );
        });
  }
}

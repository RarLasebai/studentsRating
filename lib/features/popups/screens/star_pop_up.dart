import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_states.dart';
import 'package:students_rating/features/home/domain/entites/student.dart';

class StarPopUp {
  static Future<dynamic> show(context, String starType,
      {Student? student}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => StudentsBloc()..add(GetStarOfTheDayEvent()),
            child: BlocConsumer<StudentsBloc, StudentsStates>(
              listener: (context, state) {
                if (state is StudentErrorState) {
                  const Icon(Icons.error);
                }
              },
              builder: (context, state) {
                if (state is StudentsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is StarOfTheDayState) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r)),
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: 302.w,
                      height: 316.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/yellow_star.png"),
                          SizedBox(height: 33.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TxtStyle("نجم $starType", 18, Colors.black,
                                  FontWeight.bold),
                              SizedBox(width: 29.w),
                            ],
                          ),
                          starType == "اليوم"
                              ? TxtStyle(state.student!.studentName!, 20, star,
                                  FontWeight.bold)
                              : TxtStyle(student!.studentName!, 20, star,
                                  FontWeight.bold)
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          );
        });
  }
}

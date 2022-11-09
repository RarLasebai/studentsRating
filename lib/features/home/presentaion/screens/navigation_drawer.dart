import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/data/model/student_model.dart';
import 'package:students_rating/features/home/presentaion/widgets/build_header.dart';
import 'package:students_rating/features/home/presentaion/widgets/build_menu_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    StudentModel studentModel = StudentModel();

    return Drawer(
      backgroundColor: primary,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BuildHeader(),
          BlocProvider.value(
              value: BlocProvider.of<StudentsBloc>(context),
              child: BuildMenuItem(studentModel))
        ],
      )),
    );
  }
}

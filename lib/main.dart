import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/presentaion/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp(
        title: 'Students Rating',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: BlocProvider(
          create: (context) => StudentsBloc(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}

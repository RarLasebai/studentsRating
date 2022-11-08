import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_rating/core/utils/colors/colors.dart';
import 'package:students_rating/core/utils/widget/top_nav_bar.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_bloc.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_events.dart';
import 'package:students_rating/features/home/application/HomeBloc/students_states.dart';
import 'package:students_rating/features/home/presentaion/screens/navigation_drawer.dart';
import 'package:students_rating/features/home/presentaion/widgets/student_row.dart';
import 'package:students_rating/features/home/presentaion/widgets/title_row.dart';
import 'package:students_rating/features/popups/screens/star_pop_up.dart';
import '../../domain/entites/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Student>? students;
    return BlocProvider(
      create: (context) => StudentsBloc()..add(GetStudentsEvent()),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: RepaintBoundary(
          key: StudentsBloc().printKey,
          child: Scaffold(
            appBar: TopNavBar("التقييم اليومي"),
            drawer: const NavigationDrawer(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primary,
              onPressed: () {
                
                StarPopUp.show(context, "اليوم");
              },
              child: const Icon(Icons.star),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocConsumer<StudentsBloc, StudentsStates>(
                  listener: (context, studentState) {
                    if (studentState is StudentErrorState) {
                      const Icon(Icons.error);
                    }
                  },
                  builder: (context, studentState) {
                    if (studentState is StudentLoadedState) {
                      students = studentState.students;
                      if (students!.isEmpty) {
                        return const Center(
                          child: TxtStyle("لا يوجد طلبة مسجلين بعد!", 15,
                              primary, FontWeight.normal),
                        );
                      } else {
                        return ListView(
                          children: [
                            const TitleRow(),
                            ...students!
                                .map((student) => BlocProvider.value(value: StudentsBloc(),
                                child:  StudentRow(student, contextt: context,)
                               ,))
                                .toList()
                          ],
                        );
                      }
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(color: primary));
                    }
                  },
                )),
          ),
        ),
      ),
    );
  }
}

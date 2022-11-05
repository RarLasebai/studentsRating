import 'package:flutter/material.dart';
import 'package:students_rating/core/utils/widget/txt_style.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: const Center(
          child:
              TxtStyle("الاختصارات ", 16, Colors.white, FontWeight.bold)),
    );
  }
}

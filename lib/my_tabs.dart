// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ebookapp/app_colors.dart' as AppColors;

class AppTabs extends StatelessWidget {
  final Color color;
  final String text;
  const AppTabs({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 120,
      height: 50,
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ]),
    );
  }
}

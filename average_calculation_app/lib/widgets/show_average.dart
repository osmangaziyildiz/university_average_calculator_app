// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:average_calculation_tool/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberofCourse;

  const ShowAverage(
      {super.key, required this.average, required this.numberofCourse});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberofCourse > 0
              ? "$numberofCourse course selected"
              : "Please select a course",
          style: Constants.headlineFontStyle, textAlign: TextAlign.center,
        ),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : "0.0",
          style: Constants.averageFontStyle,
        ),
        Text(
          "Average",
          style: Constants.headlineFontStyle,
        ),
      ],
    );
  }
}

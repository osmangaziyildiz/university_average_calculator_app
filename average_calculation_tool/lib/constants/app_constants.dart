import 'package:average_calculation_tool/models/course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.amber;
  static final TextStyle mainFontStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static List<Course> allEnteredCourses = [];

  static addCourse(Course enteredCourse) {
    allEnteredCourses.add(enteredCourse);
  }

  static calculateAverage() {
    double totalGrade = 0;
    double totalCredit = 0;

    for (var element in allEnteredCourses) {
      totalGrade = totalGrade + (element.creditValue * element.letterValue);
      totalCredit = totalCredit + element.creditValue;
    }
    return totalGrade / totalCredit;
  }

  static final BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle headlineFontStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle averageFontStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static List<String> _courseLetters() {
    return [
      "AA",
      "BA",
      "BB",
      "CB",
      "CC",
      "DC",
      "DD",
      "FD",
      "FF",
    ];
  }

  static double _convertLettertoNumber(String letter) {
    switch (letter) {
      case "AA":
        return 4;

      case "BA":
        return 3.5;

      case "BB":
        return 3;

      case "CB":
        return 2.5;

      case "CC":
        return 2;

      case "DC":
        return 1.5;

      case "DD":
        return 1;

      case "FD":
        return 0.5;

      case "FF":
        return 0.0;

      default:
        return 1.0;
    }
  }

  static List<DropdownMenuItem<double>> courseLettersDDMI() {
    return _courseLetters()
        .map(
          (e) => DropdownMenuItem(
            value: _convertLettertoNumber(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditsDDMI() {
    return _allCredits()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(
              e.toString(),
            ),
          ),
        )
        .toList();
  }
}

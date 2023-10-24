// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:average_calculation_tool/constants/app_constants.dart';
import 'package:average_calculation_tool/models/course.dart';
import 'package:average_calculation_tool/widgets/credit_dropdown.dart';
import 'package:average_calculation_tool/widgets/letter_dropdown.dart';
import 'package:average_calculation_tool/widgets/list_of_courses.dart';
import 'package:average_calculation_tool/widgets/show_average.dart';
import 'package:flutter/material.dart';

class AverageCalculatorPage extends StatefulWidget {
  const AverageCalculatorPage({super.key});

  @override
  State<AverageCalculatorPage> createState() => _AverageCalculatorPageState();
}

class _AverageCalculatorPageState extends State<AverageCalculatorPage> {
  var formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enteredNameofCourse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Average Calculator",
            style: Constants.mainFontStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    average: Constants.calculateAverage(),
                    numberofCourse: Constants.allEnteredCourses.length),
              ),
            ],
          ),
          Expanded(
            child: ListofCourses(
              onDismiss: (index) {
                Constants.allEnteredCourses.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: LetterDropdownWidget(onLetterSelected: (letter) {
                    selectedLetterValue = letter;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CreditDropdownWidget(onCreditSelected: (credit) {
                    selectedCreditValue = credit;
                  }),
                ),
              ),
              IconButton(
                onPressed: _addCourseAndCalculateAverage,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                iconSize: 35,
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          enteredNameofCourse = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter the course name";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Please enter the course name",
        border: OutlineInputBorder(
          borderRadius: Constants.borderRadius,
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }

  void _addCourseAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var willEnteredCourse = Course(
          name: enteredNameofCourse,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      Constants.addCourse(willEnteredCourse);
      setState(() {});
    }
  }
}

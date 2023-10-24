import 'package:average_calculation_tool/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropdownWidget({required this.onLetterSelected, super.key});

  @override
  State<LetterDropdownWidget> createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Constants.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.mainColor.shade500,
        value: selectedLetterValue,
        underline: Container(),
        items: Constants.courseLettersDDMI(),
        onChanged: (double? value) {
          setState(() {
            selectedLetterValue = value!;
            widget.onLetterSelected(selectedLetterValue);
          });
        },
      ),
    );
  }
}

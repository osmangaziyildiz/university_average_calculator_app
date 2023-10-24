import 'package:average_calculation_tool/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdownWidget({required this.onCreditSelected, super.key});

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;
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
        value: selectedCreditValue,
        underline: Container(),
        items: Constants.allCreditsDDMI(),
        onChanged: (double? value) {
          setState(() {
            selectedCreditValue = value!;
            widget.onCreditSelected(selectedCreditValue);
          });
        },
      ),
    );
  }
}

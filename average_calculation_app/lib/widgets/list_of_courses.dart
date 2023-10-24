import 'package:average_calculation_tool/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ListofCourses extends StatelessWidget {
  final Function onDismiss;
  const ListofCourses({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    return Constants.allEnteredCourses.isNotEmpty
        ? ListView.builder(
            itemCount: Constants.allEnteredCourses.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text(Constants.allEnteredCourses[index].name),
                      subtitle: Text(
                          "${Constants.allEnteredCourses[index].creditValue} Credit, Grade Value ${Constants.allEnteredCourses[index].letterValue}"),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text(
                          (Constants.allEnteredCourses[index].letterValue *
                                  Constants
                                      .allEnteredCourses[index].creditValue)
                              .toStringAsFixed(0),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please enter data",
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
                Icon(Icons.warning_amber_rounded, size: 75, color: Colors.red),
              ],
            ),
          );
  }
}

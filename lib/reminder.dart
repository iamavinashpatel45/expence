import 'package:expence/List.dart';
import 'package:expence/calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'drawer.dart';

class reminders extends StatefulWidget {
  const reminders({Key? key}) : super(key: key);

  @override
  State<reminders> createState() => _remindersState();
}

class _remindersState extends State<reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 244, 253),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 68, 59),
        ),
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        title: Text(
          "Reminders",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 68, 59),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: List_data.reminder.length,
            itemBuilder: (cotext, index) {
              String str = List_data.reminder[index];
              List<String> l = str.split(',');
              String date = l[0].substring(9, l[0].length - 14);
              String rem = l[1].substring(7, l[1].length - 2);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 68, 59), width: 1.5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 15, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              date,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 255, 68, 59),
                        ),
                        Row(
                          children: [
                            Expanded(child: Text(rem)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

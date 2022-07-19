import 'dart:convert';
import 'package:expence/Center.dart';
import 'package:expence/List.dart';
import 'package:expence/home.dart';
import 'package:expence/notification.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class noteadd extends StatefulWidget {
  final DateTime d;

  const noteadd({Key? key, required this.d}) : super(key: key);

  @override
  State<noteadd> createState() => _noteaddState();
}

class _noteaddState extends State<noteadd> {
  final _formKey = GlobalKey<FormState>();
  DateTime? date;
  String? note;

  time(DateTime d) {
    date = d;
  }

  @override
  void initState() {
    time(widget.d);
    super.initState();
  }

  add() async {
    if (_formKey.currentState!.validate()) {
      final r = new reminder(date: date.toString(), rem: note);
      String json = jsonEncode(r);
      List_data.reminder.add(json);
      SharedPreferences add = await SharedPreferences.getInstance();
      add.setStringList("reminder", List_data.reminder);
      await notifications.setnotification();
      Navigator.pop(context);
      if (List_data.data.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => center()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/note.png",
            height: 180,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.date_range),
              SizedBox(
                width: 5,
              ),
              Text(
                date!.day.toString() +
                    "-" +
                    date!.month.toString() +
                    "-" +
                    date!.year.toString(),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          note = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Reminder is Empty";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Enter Reminder",
                          labelText: "Reminder",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        add();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          HexColor("#00acc1"),
                        ),
                      ),
                      child: Text('Add')),
                ],
              ))
        ],
      ),
    );
  }
}

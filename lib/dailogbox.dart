import 'package:expence/List.dart';
import 'package:expence/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'dart:convert';

class dialog extends StatefulWidget {
  @override
  State<dialog> createState() => _dialogState();
}

class _dialogState extends State<dialog> {
  final _formKey = GlobalKey<FormState>();

  add() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences add = await SharedPreferences.getInstance();
      final l = new list(
          time: DateTime.now().hour.toString() +
              "-" +
              DateTime.now().minute.toString(),
          date: DateTime.now().day.toString() +
              "-" +
              DateTime.now().month.toString() +
              "-" +
              DateTime.now().year.toString(),
          amount: a,
          dec: dec);
      String json = jsonEncode(l);
      List_data.data.add(json);
      add.setStringList("expence", List_data.data);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myapp()));
    }
    // else
    //   {
    //     Fluttertoast.showToast(msg: 'Enter Complety Data');
    //   }
  }

  int a = 0;
  String dec = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Form(
          key: this._formKey,
          child: Column(
            children: [
              Hero(
                tag: "patel",
                child: Text(
                  'Expence',
                  style: TextStyle(color: HexColor("#00acc1")),
                ),
              ),
              Hero(
                tag: "Avi",
                child: Image.asset(
                  "assets/add.png",
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(
                  child: TextFormField(
                    onChanged: (value) {
                      a = int.parse(value);
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Amount is Empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      labelText: "Amount",
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Center(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      dec = value;
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Details is Empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Details",
                      labelText: "Details",
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
          ),
        ),
      ),
    );
  }
}

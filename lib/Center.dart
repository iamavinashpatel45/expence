import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:expence/calender.dart';
import 'package:expence/drawer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dailogbox.dart';

class center extends StatefulWidget {
  const center({Key? key}) : super(key: key);

  @override
  State<center> createState() => _centerState();
}

class _centerState extends State<center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 68, 59),
        ),
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        title: Hero(
          tag: "patel",
          child: Text(
            'Expence',
            style: TextStyle(color: Color.fromARGB(255, 255, 68, 59)),
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                calender.selectdate(context);
              },
              child: Icon(
                Icons.calendar_month,
                color: Color.fromARGB(255, 255, 68, 59),
              )),
          Padding(padding: EdgeInsets.only(right: 30)),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: "Avi",
                child: Image.asset(
                  "assets/empty.png",
                  height: 200,
                )),
            Text(
              'No Expence',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () async {
                  await CustomAlertDialogBox.showCustomAlertBox(
                      context: context, willDisplayWidget: dialog());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    HexColor("#00acc1"),
                  ),
                ),
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}

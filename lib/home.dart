import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:expence/Center.dart';
import 'package:expence/List.dart';
import 'package:expence/calender.dart';
import 'package:expence/dailogbox.dart';
import 'package:expence/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  remove(int index) async {
    List_data.data.removeAt(index);
    SharedPreferences add = await SharedPreferences.getInstance();
    add.setStringList("expence", List_data.data);
    if (List_data.data.length == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => center()));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        drawer: drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 255, 68, 59),
          ),
          backgroundColor: Color.fromARGB(255, 240, 244, 253),
          title: Text(
            'Expence',
            style: TextStyle(color: Color.fromARGB(255, 255, 68, 59)),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 68, 59),
          foregroundColor: Colors.white,
          onPressed: () async {
            await CustomAlertDialogBox.showCustomAlertBox(
                context: context, willDisplayWidget: dialog());
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: List_data.data.length,
              itemBuilder: (context, index) {
                String str = List_data.data[index];
                List<String> l = str.split(',');
                String time = l[0].substring(9, l[0].length - 1);
                String date = l[1].substring(8, l[1].length - 1);
                String amount = l[2].substring(9, l[2].length);
                String dec = l[3].substring(7, l[3].length - 2);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Color.fromARGB(255, 255, 68, 59),
                            width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Column(
                        children: [
                          ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee_sharp,
                                      color: HexColor("#00acc1"),
                                    ),
                                    Text(
                                      amount,
                                      style: TextStyle(
                                          color: HexColor("#00acc1"),
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    dec,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.date_range),
                                    Text(
                                      date,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "||",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      time,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          remove(index);
                                        },
                                        child: Icon(
                                          Icons.remove_circle_outline_rounded,
                                          color:
                                              Color.fromARGB(255, 255, 68, 59),
                                        )),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}

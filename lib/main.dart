import 'package:expence/Center.dart';
import 'package:expence/List.dart';
import 'package:expence/home.dart';
import 'package:expence/login.dart';
import 'package:expence/notification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(app());
}

bool first = true;
bool load = false;

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  bool login = true;
  bool go = false;

  call() async {
    try {
      SharedPreferences get = await SharedPreferences.getInstance();
      login = get.getBool("login")!;
      //print(get.getBool("login"));
    } catch (e) {}
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      go = true;
    });
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 68, 59),
          body: go == true
              ? login == true
                  ? log_in()
                  : Myapp()
              : Center(
                  child: Image.asset('assets/icon.png'),
                )),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  getdate() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    try {
      List<String> list = get.getStringList("expence")!;
      if (list.length != 0) {
        List_data.data = list;
      }
    } catch (e) {}
    try {
      List<String> list_1 = get.getStringList("reminder")!;
      if (list_1.length != 0) {
        List_data.reminder = list_1;
      }
    } catch (e) {}
    try {
      List_data.name = get.getString("name");
      List_data.email = get.getString("email");
      List_data.num = get.getString("num");
    } catch (e) {}
    load = true;
    first = false;
    setState(() {});
  }

  call() async {
    if (first == true) {
      await getdate();
      await notifications.setnotification();
    }
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: load == true
              ? List_data.data.isEmpty
                  ? center()
                  : Home()
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color.fromARGB(255, 240, 244, 253),
                    elevation: 0,
                    title: Hero(
                      tag: "patel",
                      child: Text(
                        'Expence',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 68, 59)),
                      ),
                    ),
                  ),
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 68, 59),
                    ),
                  ),
                )),
    );
  }
}

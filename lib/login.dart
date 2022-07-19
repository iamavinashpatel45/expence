import 'package:expence/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class log_in extends StatefulWidget {
  const log_in({Key? key}) : super(key: key);

  @override
  State<log_in> createState() => _log_inState();
}

class _log_inState extends State<log_in> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? num;
  String? email;
  bool? button = false;

  add() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        button = true;
      });
      SharedPreferences add = await SharedPreferences.getInstance();
      add.setBool("login", false);
      add.setString("name", name!);
      add.setString("num", num!);
      add.setString("email", email!);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Myapp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        elevation: 1,
        title: Hero(
          tag: "patel",
          child: Text(
            'Expence',
            style: TextStyle(color: Color.fromARGB(255, 255, 68, 59)),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset('assets/login.png'),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          labelText: "Name",
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: HexColor("#00acc1"),
                          ),
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          num = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Number";
                          }
                          if (value.length != 10) {
                            return "Enter Proper Number";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Number",
                          labelText: "Number",
                          prefixIcon: Icon(
                            Icons.call,
                            color: HexColor("#00acc1"),
                          ),
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
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }
                          if(!value.contains("@") && value.contains("."))
                            {
                              return "Enter proper Email";
                            }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: HexColor("#00acc1"),
                          ),
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
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          add();
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            color: HexColor("#00acc1"),
                            borderRadius:
                                BorderRadius.circular(button! ? 40 : 12),
                          ),
                          duration: Duration(milliseconds: 700),
                          width: button == true ? 45 : 120,
                          height: 40,
                          child: Center(
                            child: button!
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "WELCOME",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

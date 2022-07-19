import 'package:expence/List.dart';
import 'package:expence/reminder.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: ListView(
        children: [
          // DrawerHeader(
          //     child: UserAccountsDrawerHeader(
          //   accountName: Text(List_data.name!),
          //   accountEmail: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(List_data.email!),
          //       Text(List_data.num!),
          //     ],
          //   ),
          // )),
          Row(
            children: [
              Icon(Icons.person_rounded),
              Text(List_data.name!),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email),
              Text(List_data.email!),
            ],
          ),
          Row(
            children: [
              Icon(Icons.call),
              Text(List_data.num!),
            ],
          ),
          InkWell(
            onTap: () {
              print(List_data.reminder.length);
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => reminders()));
            },
            child: Row(
              children: [
                Icon(Icons.description),
                Text("Reminders"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

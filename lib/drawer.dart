import 'package:expence/List.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

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
          DrawerHeader(
              child: UserAccountsDrawerHeader(
            accountName: Text(List_data.name!),
            accountEmail: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(List_data.email!),
                Text(List_data.num!),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

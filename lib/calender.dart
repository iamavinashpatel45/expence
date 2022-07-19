import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:expence/noteadd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calender {
  static Future<Null> selectdate(BuildContext context) async {
    DateTime? selectdate = await showDatePicker(
        context: context,
        firstDate: DateTime.now().add(Duration(days: 1)),
        initialDate: DateTime.now().add(Duration(days: 1)),
        lastDate: DateTime(2027));
    if (selectdate != null) {
      await CustomAlertDialogBox.showCustomAlertBox(
          context: context,
          willDisplayWidget: noteadd(
            d: selectdate,
          ));
    }
  }
}

import 'package:expence/List.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class notifications {
  static var notification = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    var androidIni = new AndroidInitializationSettings("icon");
    var isoIni = new IOSInitializationSettings();
    var settingIni =
        new InitializationSettings(android: androidIni, iOS: isoIni);
    notification = new FlutterLocalNotificationsPlugin();
    notification.initialize(settingIni,
        onSelectNotification: notificationselected());
  }

  static notificationselected() {}

  static Future details() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      'Avinash PAtel',
      'Avi',
      importance: Importance.max,
    ));
  }

  static shownotificatio(
      {int id = 0, String? title, String? body, DateTime? date}) async {
    notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(date!, tz.local).add(Duration(seconds: 15)),
        await details(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  static setnotification() async {
    await init();
    tz.initializeTimeZones();
    for (int i = 0; i < List_data.reminder.length; i++) {
      String str = List_data.reminder[i];
      List<String> l = str.split(',');
      String date_str = l[0].substring(9, l[0].length - 1);
      String rem = l[1].substring(7, l[1].length - 2);
      DateTime date_1 = DateTime.parse(date_str);
      var date=date_1.add(Duration(hours: 7));
      shownotificatio(
          id: 0, title: "Reminder", body: rem, date: date);
    }
  }
}

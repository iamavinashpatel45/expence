class list {
  String? time;
  String? date;
  int? amount;
  String? dec;

  list({this.time, this.date, this.amount, this.dec});

  list.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    date = json['date'];
    amount = json['amount'];
    dec = json['dec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['dec'] = this.dec;
    return data;
  }
}

class reminder {
  String? date;
  String? rem;

  reminder({this.date, this.rem});

  reminder.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    rem = json['rem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['rem'] = this.rem;
    return data;
  }
}

class List_data {
  static List<String> data = [];
  static List<String> reminder = [];
  static String? name;
  static String? email;
  static String? num;
}

class Forgot {
  String email;
  int type;

  Forgot({this.email, this.type});

  Forgot.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['type'] = this.type;
    return data;
  }
}
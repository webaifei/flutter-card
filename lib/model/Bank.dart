class Bank {
  String logo;
  String title;
  String id;

  Bank({this.logo, this.title, this.id});

  Bank.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}
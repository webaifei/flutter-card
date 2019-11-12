class BankCardModel {
  String cardNum;
  String cardId;
  List<String> rights;
  String logo;
  String payDay;
  String bankName;
  String title;
  String type;

  BankCardModel(
      {this.cardNum,
        this.cardId,
        this.rights,
        this.logo,
        this.payDay,
        this.bankName,
        this.title,
        this.type});

  BankCardModel.fromJson(Map<String, dynamic> json) {
    cardNum = json['cardNum'];
    cardId = json['cardId'];
    rights = json['rights']?.cast<String>();
    logo = json['logo'];
    payDay = json['payDay'];
    bankName = json['bankName'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNum'] = this.cardNum;
    data['cardId'] = this.cardId;
    data['rights'] = this.rights;
    data['logo'] = this.logo;
    data['payDay'] = this.payDay;
    data['bankName'] = this.bankName;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
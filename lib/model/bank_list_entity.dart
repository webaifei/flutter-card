import 'Bank.dart';

class BankListEntity {
	List<Bank> bankList;

	BankListEntity({this.bankList});

	BankListEntity.fromJson(Map<String, dynamic> json) {
		if (json['bankList'] != null) {
			bankList = new List<Bank>();(json['bankList'] as List).forEach((v) { bankList.add(new Bank.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.bankList != null) {
      data['bankList'] =  this.bankList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}



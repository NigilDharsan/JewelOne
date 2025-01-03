class ClosedAccountModel {
  List<Data>? data;
  bool? status;
  String? message;

  ClosedAccountModel({this.data, this.status, this.message});

  ClosedAccountModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? pkId;
  int? idSchemeAccount;
  String? accountName;
  String? startDate;
  String? closingDate;
  String? closingBalance;
  String? closingAmount;
  String? closingWeight;
  String? additionalBenefits;
  String? schemeAccNumber;
  String? branchName;
  String? schemeName;
  String? customerName;
  String? mobile;

  Data(
      {this.pkId,
      this.idSchemeAccount,
      this.accountName,
      this.startDate,
      this.closingDate,
      this.closingBalance,
      this.closingAmount,
      this.closingWeight,
      this.additionalBenefits,
      this.schemeAccNumber,
      this.branchName,
      this.schemeName,
      this.customerName,
      this.mobile});

  Data.fromJson(Map<String, dynamic> json) {
    pkId = json['pk_id'];
    idSchemeAccount = json['id_scheme_account'];
    accountName = json['account_name'];
    startDate = json['start_date'];
    closingDate = json['closing_date'];
    closingBalance = json['closing_balance'];
    closingAmount = json['closing_amount'];
    closingWeight = json['closing_weight'];
    additionalBenefits = json['additional_benefits'];
    schemeAccNumber = json['scheme_acc_number'];
    branchName = json['branch_name'];
    schemeName = json['scheme_name'];
    customerName = json['customer_name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_id'] = this.pkId;
    data['id_scheme_account'] = this.idSchemeAccount;
    data['account_name'] = this.accountName;
    data['start_date'] = this.startDate;
    data['closing_date'] = this.closingDate;
    data['closing_balance'] = this.closingBalance;
    data['closing_amount'] = this.closingAmount;
    data['closing_weight'] = this.closingWeight;
    data['additional_benefits'] = this.additionalBenefits;
    data['scheme_acc_number'] = this.schemeAccNumber;
    data['branch_name'] = this.branchName;
    data['scheme_name'] = this.schemeName;
    data['customer_name'] = this.customerName;
    data['mobile'] = this.mobile;
    return data;
  }
}

class PaymentHistoryModel {
  String? message;
  List<PaymentHistoryData>? responseData;

  PaymentHistoryModel({this.message, this.responseData});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['response_data'] != null) {
      responseData = <PaymentHistoryData>[];
      json['response_data'].forEach((v) {
        responseData!.add(new PaymentHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.responseData != null) {
      data['response_data'] =
          this.responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentHistoryData {
  int? paymentId;
  int? customerId;
  int? id_scheme_account;
  String? paymentDate;
  String? receipt_no;
  String? amount;
  String? accountNumber;
  String? paymentMode;
  String? metalRate;
  String? metalWeight;
  String? schemeName;
  String? statusName;
  String? statusColor;

  PaymentHistoryData(
      {this.paymentId,
      this.customerId,
      this.id_scheme_account,
      this.paymentDate,
      this.receipt_no,
      this.amount,
      this.accountNumber,
      this.paymentMode,
      this.metalRate,
      this.metalWeight,
      this.schemeName,
      this.statusName,
      this.statusColor});

  PaymentHistoryData.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    customerId = json['customer_id'];
    id_scheme_account = json['id_scheme_account'];
    paymentDate = json['payment_date'];
    receipt_no = json['receipt_no'];
    amount = json['amount'];
    accountNumber = json['account_number'];
    paymentMode = json['payment_mode'];
    metalRate = json['metal_rate'];
    metalWeight = json['metal_weight'];
    schemeName = json['scheme_name'];
    statusName = json['status_name'];
    statusColor = json['status_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['customer_id'] = this.customerId;
    data['id_scheme_account'] = this.id_scheme_account;
    data['payment_date'] = this.paymentDate;
    data['receipt_no'] = this.receipt_no;
    data['amount'] = this.amount;
    data['account_number'] = this.accountNumber;
    data['payment_mode'] = this.paymentMode;
    data['metal_rate'] = this.metalRate;
    data['metal_weight'] = this.metalWeight;
    data['scheme_name'] = this.schemeName;
    data['status_name'] = this.statusName;
    data['status_color'] = this.statusColor;
    return data;
  }
}

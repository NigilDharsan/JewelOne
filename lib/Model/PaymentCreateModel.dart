class PaymentCreateModel {
  String? message;
  String? paymentSessionId;
  String? orderId;
  double? orderAmount;
  int? idPayment;
  String? pdfPath;

  PaymentCreateModel(
      {this.message,
      this.paymentSessionId,
      this.orderId,
      this.orderAmount,
      this.idPayment,
      this.pdfPath});

  PaymentCreateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    paymentSessionId = json['payment_session_id'];
    orderId = json['order_id'];
    orderAmount = json['order_amount'];
    idPayment = json['id_payment'];
    pdfPath = json['pdf_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['payment_session_id'] = this.paymentSessionId;
    data['order_id'] = this.orderId;
    data['order_amount'] = this.orderAmount;
    data['id_payment'] = this.idPayment;
    data['pdf_path'] = this.pdfPath;
    return data;
  }
}

class SignUpModel {
  bool? success;
  String? successTitle;
  String? successMessage;
  String? message;

  SignUpModel(
      {this.success, this.successTitle, this.successMessage, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    successTitle = json['success_title'];
    successMessage = json['success_message'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['success_title'] = this.successTitle;
    data['success_message'] = this.successMessage;
    data['message'] = this.message;
    return data;
  }
}

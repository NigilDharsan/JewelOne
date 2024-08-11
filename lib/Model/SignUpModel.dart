

class SignUpModel {
  bool? status;
  String? title;
  String? message;

  SignUpModel({this.status, this.title, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['title'] = this.title;
    data['message'] = this.message;
    return data;
  }
}

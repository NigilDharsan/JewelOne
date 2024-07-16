class Forgot_Password_Model {
  List<String>? errorDetail;

  Forgot_Password_Model({this.errorDetail});

  Forgot_Password_Model.fromJson(Map<String, dynamic> json) {
    errorDetail = json['error_detail'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_detail'] = this.errorDetail;
    return data;
  }
}

class ActiveLocationModel {
  List<Data>? data;

  ActiveLocationModel({this.data});

  ActiveLocationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? shortName;
  Null? email;
  Null? address1;
  Null? address2;
  Null? mobile;
  Null? pincode;
  String? city;
  String? state;
  String? stoneHours;

  Data(
      {this.name,
        this.shortName,
        this.email,
        this.address1,
        this.address2,
        this.mobile,
        this.pincode,
        this.city,
        this.state,
        this.stoneHours});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortName = json['short_name'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    mobile = json['mobile'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    stoneHours = json['stone_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['email'] = this.email;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['mobile'] = this.mobile;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['stone_hours'] = this.stoneHours;
    return data;
  }
}
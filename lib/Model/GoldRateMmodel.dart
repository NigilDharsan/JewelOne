class GoldRateModel {
  String? message;
  Data? data;

  GoldRateModel({this.message, this.data});

  GoldRateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? rateId;
  String? gold18ct;
  String? gold20ct;
  String? gold22ct;
  String? gold24ct;
  String? gold995ct;
  String? platinum;
  String? silverG;
  String? silverKG;
  String? silver999;
  Null? updatetime;
  bool? status;
  Null? createdOn;
  Null? updatedOn;
  int? createdBy;
  Null? updatedBy;

  Data(
      {this.rateId,
        this.gold18ct,
        this.gold20ct,
        this.gold22ct,
        this.gold24ct,
        this.gold995ct,
        this.platinum,
        this.silverG,
        this.silverKG,
        this.silver999,
        this.updatetime,
        this.status,
        this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    rateId = json['rate_id'];
    gold18ct = json['gold_18ct'];
    gold20ct = json['gold_20ct'];
    gold22ct = json['gold_22ct'];
    gold24ct = json['gold_24ct'];
    gold995ct = json['gold_99_5ct'];
    platinum = json['platinum'];
    silverG = json['silver_G'];
    silverKG = json['silver_KG'];
    silver999 = json['silver_99_9'];
    updatetime = json['updatetime'];
    status = json['status'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate_id'] = this.rateId;
    data['gold_18ct'] = this.gold18ct;
    data['gold_20ct'] = this.gold20ct;
    data['gold_22ct'] = this.gold22ct;
    data['gold_24ct'] = this.gold24ct;
    data['gold_99_5ct'] = this.gold995ct;
    data['platinum'] = this.platinum;
    data['silver_G'] = this.silverG;
    data['silver_KG'] = this.silverKG;
    data['silver_99_9'] = this.silver999;
    data['updatetime'] = this.updatetime;
    data['status'] = this.status;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

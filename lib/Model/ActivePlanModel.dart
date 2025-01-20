class ActivePlanModel {
  List<Data>? data;

  ActivePlanModel({this.data});

  ActivePlanModel.fromJson(Map<String, dynamic> json) {
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
  int? schemeId;
  String? schemeName;
  String? schemeCode;
  int? schemeType;
  String? schemeDescription;
  bool? kycReq;
  bool? allowAdvance;
  int? numberOfAdvance;
  bool? allowPendingDue;
  int? numberOfPendingDue;
  bool? convertToWeight;
  bool? status;
  bool? allowJoin;
  bool? unpaidAsDef;
  bool? allowDue;
  int? totalInstalment;
  int? schemeVis;
  String? createdOn;
  String? updatedOn;
  int? schIdMetal;
  int? schClassification;
  int? schIdPurity;
  int? createdBy;
  int? updatedBy;
  double? minimumAmount;

  Data(
      {this.schemeId,
      this.schemeName,
      this.schemeCode,
      this.schemeType,
      this.schemeDescription,
      this.kycReq,
      this.allowAdvance,
      this.numberOfAdvance,
      this.allowPendingDue,
      this.numberOfPendingDue,
      this.convertToWeight,
      this.status,
      this.allowJoin,
      this.unpaidAsDef,
      this.allowDue,
      this.totalInstalment,
      this.schemeVis,
      this.createdOn,
      this.updatedOn,
      this.schIdMetal,
      this.schClassification,
      this.schIdPurity,
      this.createdBy,
      this.updatedBy,
      this.minimumAmount});

  Data.fromJson(Map<String, dynamic> json) {
    schemeId = json['scheme_id'] ?? 0;
    schemeName = json['scheme_name'];
    schemeCode = json['scheme_code'];
    schemeType = json['scheme_type'];
    schemeDescription = json['scheme_description'];
    kycReq = json['kyc_req'];
    allowAdvance = json['allow_advance'];
    numberOfAdvance = json['number_of_advance'];
    allowPendingDue = json['allow_pending_due'];
    numberOfPendingDue = json['number_of_pending_due'];
    convertToWeight = json['convert_to_weight'];
    status = json['status'];
    allowJoin = json['allow_join'];
    unpaidAsDef = json['unpaid_as_def'];
    allowDue = json['allow_due'];
    totalInstalment = json['total_instalment'];
    schemeVis = json['scheme_vis'];

    createdOn = json['created_on'] ?? "";
    updatedOn = json['updated_on'] ?? "";
    schIdMetal = json['sch_id_metal'];
    schClassification = json['sch_classification'];
    schIdPurity = json['sch_id_purity'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    minimumAmount = json['minimum_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheme_id'] = this.schemeId;
    data['scheme_name'] = this.schemeName;
    data['scheme_code'] = this.schemeCode;
    data['scheme_type'] = this.schemeType;
    data['scheme_description'] = this.schemeDescription;
    data['kyc_req'] = this.kycReq;
    data['allow_advance'] = this.allowAdvance;
    data['number_of_advance'] = this.numberOfAdvance;
    data['allow_pending_due'] = this.allowPendingDue;
    data['number_of_pending_due'] = this.numberOfPendingDue;
    data['convert_to_weight'] = this.convertToWeight;
    data['status'] = this.status;
    data['allow_join'] = this.allowJoin;
    data['unpaid_as_def'] = this.unpaidAsDef;
    data['allow_due'] = this.allowDue;
    data['total_instalment'] = this.totalInstalment;
    data['scheme_vis'] = this.schemeVis;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['sch_id_metal'] = this.schIdMetal;
    data['sch_classification'] = this.schClassification;
    data['sch_id_purity'] = this.schIdPurity;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['minimum_amount'] = this.minimumAmount;

    return data;
  }
}

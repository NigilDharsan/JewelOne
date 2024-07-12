class BannerModel {
  int? bannerId;
  String? bannerName;
  String? bannerImg;
  bool? bannerStatus;
  Null? bannerDescription;
  Null? createdOn;
  Null? updatedOn;
  int? createdBy;
  Null? updatedBy;

  BannerModel(
      {this.bannerId,
        this.bannerName,
        this.bannerImg,
        this.bannerStatus,
        this.bannerDescription,
        this.createdOn,
        this.updatedOn,
        this.createdBy,
        this.updatedBy});

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerName = json['banner_name'];
    bannerImg = json['banner_img'];
    bannerStatus = json['banner_status'];
    bannerDescription = json['banner_description'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_id'] = this.bannerId;
    data['banner_name'] = this.bannerName;
    data['banner_img'] = this.bannerImg;
    data['banner_status'] = this.bannerStatus;
    data['banner_description'] = this.bannerDescription;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

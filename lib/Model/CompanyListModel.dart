class CompanyListModel {
  int? idCompany;
  String? companyName;
  String? shortCode;
  String? compNameInSms;
  String? address1;
  String? address2;
  String? pincode;
  String? mobCode;
  String? mobile;
  Null? phone;
  String? email;
  Null? website;
  Null? bankAccNumber;
  Null? bankName;
  Null? bankAccName;
  Null? bankBranch;
  Null? bankIfsc;
  String? dateAdd;
  Null? dateUpd;
  Null? phoneno;
  Null? mobileno;
  String? gstNumber;
  Null? cinNumber;
  String? whatsappNo;
  Null? image;
  int? idTenant;
  int? country;
  int? state;
  int? city;
  String? countryName;
  String? cityName;
  String? stateName;
  String? currencyCode;
  String? currencySybmol;
  IdCountry? idCountry;
  IdState? idState;
  IdState? idCity;

  CompanyListModel(
      {this.idCompany,
      this.companyName,
      this.shortCode,
      this.compNameInSms,
      this.address1,
      this.address2,
      this.pincode,
      this.mobCode,
      this.mobile,
      this.phone,
      this.email,
      this.website,
      this.bankAccNumber,
      this.bankName,
      this.bankAccName,
      this.bankBranch,
      this.bankIfsc,
      this.dateAdd,
      this.dateUpd,
      this.phoneno,
      this.mobileno,
      this.gstNumber,
      this.cinNumber,
      this.whatsappNo,
      this.image,
      this.idTenant,
      this.country,
      this.state,
      this.city,
      this.countryName,
      this.cityName,
      this.stateName,
      this.currencyCode,
      this.currencySybmol,
      this.idCountry,
      this.idState,
      this.idCity});

  CompanyListModel.fromJson(Map<String, dynamic> json) {
    idCompany = json['id_company'];
    companyName = json['company_name'];
    shortCode = json['short_code'];
    compNameInSms = json['comp_name_in_sms'];
    address1 = json['address1'];
    address2 = json['address2'];
    pincode = json['pincode'];
    mobCode = json['mob_code'];
    mobile = json['mobile'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    bankAccNumber = json['bank_acc_number'];
    bankName = json['bank_name'];
    bankAccName = json['bank_acc_name'];
    bankBranch = json['bank_branch'];
    bankIfsc = json['bank_ifsc'];
    dateAdd = json['date_add'];
    dateUpd = json['date_upd'];
    phoneno = json['phoneno'];
    mobileno = json['mobileno'];
    gstNumber = json['gst_number'];
    cinNumber = json['cin_number'];
    whatsappNo = json['whatsapp_no'];
    image = json['image'];
    idTenant = json['id_tenant'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    countryName = json['country_name'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    currencyCode = json['currency_code'];
    currencySybmol = json['currency_sybmol'];
    idCountry = json['id_country'] != null
        ? new IdCountry.fromJson(json['id_country'])
        : null;
    idState = json['id_state'] != null
        ? new IdState.fromJson(json['id_state'])
        : null;
    idCity =
        json['id_city'] != null ? new IdState.fromJson(json['id_city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_company'] = this.idCompany;
    data['company_name'] = this.companyName;
    data['short_code'] = this.shortCode;
    data['comp_name_in_sms'] = this.compNameInSms;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['pincode'] = this.pincode;
    data['mob_code'] = this.mobCode;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['website'] = this.website;
    data['bank_acc_number'] = this.bankAccNumber;
    data['bank_name'] = this.bankName;
    data['bank_acc_name'] = this.bankAccName;
    data['bank_branch'] = this.bankBranch;
    data['bank_ifsc'] = this.bankIfsc;
    data['date_add'] = this.dateAdd;
    data['date_upd'] = this.dateUpd;
    data['phoneno'] = this.phoneno;
    data['mobileno'] = this.mobileno;
    data['gst_number'] = this.gstNumber;
    data['cin_number'] = this.cinNumber;
    data['whatsapp_no'] = this.whatsappNo;
    data['image'] = this.image;
    data['id_tenant'] = this.idTenant;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country_name'] = this.countryName;
    data['city_name'] = this.cityName;
    data['state_name'] = this.stateName;
    data['currency_code'] = this.currencyCode;
    data['currency_sybmol'] = this.currencySybmol;
    if (this.idCountry != null) {
      data['id_country'] = this.idCountry!.toJson();
    }
    if (this.idState != null) {
      data['id_state'] = this.idState!.toJson();
    }
    if (this.idCity != null) {
      data['id_city'] = this.idCity!.toJson();
    }
    return data;
  }
}

class IdCountry {
  int? value;
  String? label;
  String? currencyCode;

  IdCountry({this.value, this.label, this.currencyCode});

  IdCountry.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    data['currency_code'] = this.currencyCode;
    return data;
  }
}

class IdState {
  int? value;
  String? label;

  IdState({this.value, this.label});

  IdState.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class LoginModel {
  String? token;
  String? loginExpiry;
  bool? redirect;
  Customer? customer;
  String? message;

  LoginModel({this.token, this.loginExpiry, this.redirect, this.customer});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    loginExpiry = json['login_expiry'];
    redirect = json['redirect'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['login_expiry'] = this.loginExpiry;
    data['redirect'] = this.redirect;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['message'] = this.message;

    return data;
  }
}

class Customer {
  int? idCustomer;
  String? email;
  String? mobCode;
  Null? referenceNo;
  int? idBranch;
  String? idArea;
  String? title;
  String? lastname;
  String? firstname;
  String? dateOfBirth;
  String? dateOfWed;
  int? gender;
  String? mobile;
  String? cusImg;
  String? comments;
  String? profileComplete;
  bool? active;
  String? dateAdd;
  String? customEntryDate;
  String? dateUpd;
  bool? notification;
  String? gstNumber;
  String? panNumber;
  String? cusRefCode;
  bool? isRefbenefitCrtCus;
  String? empRefCode;
  bool? isRefbenefitCrtEmp;
  int? religion;
  bool? kycStatus;
  bool? isCusSynced;
  Null? lastSyncTime;
  Null? lastPaymentOn;
  bool? isVip;
  bool? isEmailVerified;
  int? registeredThrough;
  String? cusType;
  bool? sendPromoSms;
  String? createdOn;
  Null? updatedOn;
  int? user;

  Customer({
    this.idCustomer,
    this.email,
    this.mobCode,
    this.referenceNo,
    this.idBranch,
    this.idArea,
    this.title,
    this.lastname,
    this.firstname,
    this.dateOfBirth,
    this.dateOfWed,
    this.gender,
    this.mobile,
    this.cusImg,
    this.comments,
    this.profileComplete,
    this.active,
    this.dateAdd,
    this.customEntryDate,
    this.dateUpd,
    this.notification,
    this.gstNumber,
    this.panNumber,
    this.cusRefCode,
    this.isRefbenefitCrtCus,
    this.empRefCode,
    this.isRefbenefitCrtEmp,
    this.religion,
    this.kycStatus,
    this.isCusSynced,
    this.lastSyncTime,
    this.lastPaymentOn,
    this.isVip,
    this.isEmailVerified,
    this.registeredThrough,
    this.cusType,
    this.sendPromoSms,
    this.createdOn,
    this.updatedOn,
    this.user,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    idCustomer = json['id_customer'];
    email = json['email'];
    mobCode = json['mob_code'];
    referenceNo = json['reference_no'];
    idBranch = json['id_branch'];
    idArea = json['id_area'];
    title = json['title'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    dateOfBirth = json['date_of_birth'];
    dateOfWed = json['date_of_wed'];
    gender = json['gender'];
    mobile = json['mobile'];
    cusImg = json['cus_img'];
    comments = json['comments'];
    profileComplete = json['profile_complete'];
    active = json['active'];
    dateAdd = json['date_add'];
    customEntryDate = json['custom_entry_date'];
    dateUpd = json['date_upd'];
    notification = json['notification'];
    gstNumber = json['gst_number'];
    panNumber = json['pan_number'];
    cusRefCode = json['cus_ref_code'];
    isRefbenefitCrtCus = json['is_refbenefit_crt_cus'];
    empRefCode = json['emp_ref_code'];
    isRefbenefitCrtEmp = json['is_refbenefit_crt_emp'];
    religion = json['religion'];
    kycStatus = json['kyc_status'];
    isCusSynced = json['is_cus_synced'];
    lastSyncTime = json['last_sync_time'];
    lastPaymentOn = json['last_payment_on'];
    isVip = json['is_vip'];
    isEmailVerified = json['is_email_verified'];
    registeredThrough = json['registered_through'];
    cusType = json['cus_type'];
    sendPromoSms = json['send_promo_sms'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_customer'] = this.idCustomer;
    data['email'] = this.email;
    data['mob_code'] = this.mobCode;
    data['reference_no'] = this.referenceNo;
    data['id_branch'] = this.idBranch;
    data['id_area'] = this.idArea;
    data['title'] = this.title;
    data['lastname'] = this.lastname;
    data['firstname'] = this.firstname;
    data['date_of_birth'] = this.dateOfBirth;
    data['date_of_wed'] = this.dateOfWed;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['cus_img'] = this.cusImg;
    data['comments'] = this.comments;
    data['profile_complete'] = this.profileComplete;
    data['active'] = this.active;
    data['date_add'] = this.dateAdd;
    data['custom_entry_date'] = this.customEntryDate;
    data['date_upd'] = this.dateUpd;
    data['notification'] = this.notification;
    data['gst_number'] = this.gstNumber;
    data['pan_number'] = this.panNumber;
    data['cus_ref_code'] = this.cusRefCode;
    data['is_refbenefit_crt_cus'] = this.isRefbenefitCrtCus;
    data['emp_ref_code'] = this.empRefCode;
    data['is_refbenefit_crt_emp'] = this.isRefbenefitCrtEmp;
    data['religion'] = this.religion;
    data['kyc_status'] = this.kycStatus;
    data['is_cus_synced'] = this.isCusSynced;
    data['last_sync_time'] = this.lastSyncTime;
    data['last_payment_on'] = this.lastPaymentOn;
    data['is_vip'] = this.isVip;
    data['is_email_verified'] = this.isEmailVerified;
    data['registered_through'] = this.registeredThrough;
    data['cus_type'] = this.cusType;
    data['send_promo_sms'] = this.sendPromoSms;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['user'] = this.user;

    return data;
  }
}

class MyPlanModel {
  String? message;
  List<Data>? data;

  MyPlanModel({this.message, this.data});

  MyPlanModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idSchemeAccount;
  String? accountName;
  int? idBranch;
  String? startDate;
  String? schemeAccNumber;
  String? branchName;
  String? schemeName;
  String? customerName;
  String? mobile;
  int? paidInstallments;
  bool? allowAdvance;
  int? advanceMonths;
  int? totalInstallments;
  int? paidWeight;
  String? lastPaidDate;
  int? todaysRate;
  int? limitType;
  int? paymentChanceType;
  int? paymentChanceValue;
  String? discountType;
  String? discountValue;
  MinimumPayable? minimumPayable;
  MaximumPayable? maximumPayable;
  bool? allowPay;
  String? forSearch;

  Data(
      {this.idSchemeAccount,
        this.accountName,
        this.idBranch,
        this.startDate,
        this.schemeAccNumber,
        this.branchName,
        this.schemeName,
        this.customerName,
        this.mobile,
        this.paidInstallments,
        this.allowAdvance,
        this.advanceMonths,
        this.totalInstallments,
        this.paidWeight,
        this.lastPaidDate,
        this.todaysRate,
        this.limitType,
        this.paymentChanceType,
        this.paymentChanceValue,
        this.discountType,
        this.discountValue,
        this.minimumPayable,
        this.maximumPayable,
        this.allowPay,
        this.forSearch});

  Data.fromJson(Map<String, dynamic> json) {
    idSchemeAccount = json['id_scheme_account'];
    accountName = json['account_name'];
    idBranch = json['id_branch'];
    startDate = json['start_date'];
    schemeAccNumber = json['scheme_acc_number'];
    branchName = json['branch_name'];
    schemeName = json['scheme_name'];
    customerName = json['customer_name'];
    mobile = json['mobile'];
    paidInstallments = json['paid_installments'];
    allowAdvance = json['allow_advance'];
    advanceMonths = json['advance_months'];
    totalInstallments = json['total_installments'];
    paidWeight = json['paid_weight'];
    lastPaidDate = json['last_paid_date'];
    todaysRate = json['todays_rate'];
    limitType = json['limit_type'];
    paymentChanceType = json['payment_chance_type'];
    paymentChanceValue = json['payment_chance_value'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    minimumPayable = json['minimum_payable'] != null
        ? new MinimumPayable.fromJson(json['minimum_payable'])
        : null;
    maximumPayable = json['maximum_payable'] != null
        ? new MaximumPayable.fromJson(json['maximum_payable'])
        : null;
    allowPay = json['allow_pay'];
    forSearch = json['for_search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_scheme_account'] = this.idSchemeAccount;
    data['account_name'] = this.accountName;
    data['id_branch'] = this.idBranch;
    data['start_date'] = this.startDate;
    data['scheme_acc_number'] = this.schemeAccNumber;
    data['branch_name'] = this.branchName;
    data['scheme_name'] = this.schemeName;
    data['customer_name'] = this.customerName;
    data['mobile'] = this.mobile;
    data['paid_installments'] = this.paidInstallments;
    data['allow_advance'] = this.allowAdvance;
    data['advance_months'] = this.advanceMonths;
    data['total_installments'] = this.totalInstallments;
    data['paid_weight'] = this.paidWeight;
    data['last_paid_date'] = this.lastPaidDate;
    data['todays_rate'] = this.todaysRate;
    data['limit_type'] = this.limitType;
    data['payment_chance_type'] = this.paymentChanceType;
    data['payment_chance_value'] = this.paymentChanceValue;
    data['discount_type'] = this.discountType;
    data['discount_value'] = this.discountValue;
    if (this.minimumPayable != null) {
      data['minimum_payable'] = this.minimumPayable!.toJson();
    }
    if (this.maximumPayable != null) {
      data['maximum_payable'] = this.maximumPayable!.toJson();
    }
    data['allow_pay'] = this.allowPay;
    data['for_search'] = this.forSearch;
    return data;
  }
}

class MinimumPayable {
  String? minAmount;
  int? minWeight;

  MinimumPayable({this.minAmount, this.minWeight});

  MinimumPayable.fromJson(Map<String, dynamic> json) {
    minAmount = json['min_amount'];
    minWeight = json['min_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_amount'] = this.minAmount;
    data['min_weight'] = this.minWeight;
    return data;
  }
}

class MaximumPayable {
  int? maxWeight;
  String? maxAmount;

  MaximumPayable({this.maxWeight, this.maxAmount});

  MaximumPayable.fromJson(Map<String, dynamic> json) {
    maxWeight = json['max_weight'];
    maxAmount = json['max_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max_weight'] = this.maxWeight;
    data['max_amount'] = this.maxAmount;
    return data;
  }
}

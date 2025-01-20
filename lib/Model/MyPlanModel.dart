class MyPlanModel {
  String? message;
  List<MyPlanData>? data;

  MyPlanModel({this.message, this.data});

  MyPlanModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MyPlanData>[];
      json['data'].forEach((v) {
        data!.add(new MyPlanData.fromJson(v));
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

class MyPlanData {
  int? idScheme;
  int? idSchemeAccount;
  String? accountName;
  int? idBranch;
  String? startDate;
  String? schemeAccNumber;
  String? branchName;
  String? schemeName;
  bool? convertToWeight;
  int? taxType;
  int? taxId;
  String? customerName;
  String? mobile;
  int? paidInstallments;
  bool? allowAdvance;
  int? advanceMonths;
  int? totalInstallments;
  double? paidAmount;
  double? paidWeight;
  String? lastPaidDate;
  double? todaysRate;
  int? limitType;
  int? paymentChanceType;
  int? paymentChanceValue;
  int? discountType;
  int? discountValue;
  int? denomType;
  int? denomValue;
  MinimumPayable? minimumPayable;
  MaximumPayable? maximumPayable;
  bool? allowPay;
  List<AmountDenom>? amountDenom;
  List<AmountDenom>? weightDenom;
  String? forSearch;
  double? taxPercentage;

  String? enterAmount;
  int? incrementCount = 1;
  bool? isChecked = false;
  String? totalWeight;
  String? totalAmount;
  String? selectedGram;
  String? selectedAmount;

  MyPlanData(
      {this.idScheme,
      this.idSchemeAccount,
      this.accountName,
      this.idBranch,
      this.startDate,
      this.schemeAccNumber,
      this.branchName,
      this.schemeName,
      this.convertToWeight,
      this.taxType,
      this.taxId,
      this.customerName,
      this.mobile,
      this.paidInstallments,
      this.allowAdvance,
      this.advanceMonths,
      this.totalInstallments,
      this.paidAmount,
      this.paidWeight,
      this.lastPaidDate,
      this.todaysRate,
      this.limitType,
      this.paymentChanceType,
      this.paymentChanceValue,
      this.discountType,
      this.discountValue,
      this.denomType,
      this.denomValue,
      this.minimumPayable,
      this.maximumPayable,
      this.allowPay,
      this.amountDenom,
      this.weightDenom,
      this.forSearch,
      this.taxPercentage,
      this.enterAmount,
      this.incrementCount,
      this.isChecked,
      this.totalAmount,
      this.selectedAmount,
      this.selectedGram});

  MyPlanData.fromJson(Map<String, dynamic> json) {
    idScheme = json['id_scheme'];
    idSchemeAccount = json['id_scheme_account'];
    accountName = json['account_name'];
    idBranch = json['id_branch'];
    startDate = json['start_date'];
    schemeAccNumber = json['scheme_acc_number'];
    branchName = json['branch_name'];
    schemeName = json['scheme_name'];
    convertToWeight = json['convert_to_weight'];
    taxType = json['tax_type'];
    taxId = json['tax_id'];
    customerName = json['customer_name'];
    mobile = json['mobile'];
    paidInstallments = json['paid_installments'];
    allowAdvance = json['allow_advance'];
    advanceMonths = json['advance_months'];
    totalInstallments = json['total_installments'];
    paidAmount = json['paid_amount'];
    paidWeight = json['paid_weight'];
    lastPaidDate = json['last_paid_date'];
    todaysRate = json['todays_rate'];
    limitType = json['limit_type'];
    paymentChanceType = json['payment_chance_type'];
    paymentChanceValue = json['payment_chance_value'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    denomType = json['denom_type'];
    denomValue = json['denom_value'];
    minimumPayable = json['minimum_payable'] != null
        ? new MinimumPayable.fromJson(json['minimum_payable'])
        : null;
    maximumPayable = json['maximum_payable'] != null
        ? new MaximumPayable.fromJson(json['maximum_payable'])
        : null;
    allowPay = json['allow_pay'];
    if (json['amount_denom'] != null) {
      amountDenom = <AmountDenom>[];
      json['amount_denom'].forEach((v) {
        amountDenom!.add(new AmountDenom.fromJson(v));
      });
    }
    if (json['weight_denom'] != null) {
      weightDenom = <AmountDenom>[];
      json['weight_denom'].forEach((v) {
        weightDenom!.add(new AmountDenom.fromJson(v));
      });
    }
    forSearch = json['for_search'];
    taxPercentage = json['tax_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_scheme'] = this.idScheme;
    data['id_scheme_account'] = this.idSchemeAccount;
    data['account_name'] = this.accountName;
    data['id_branch'] = this.idBranch;
    data['start_date'] = this.startDate;
    data['scheme_acc_number'] = this.schemeAccNumber;
    data['branch_name'] = this.branchName;
    data['scheme_name'] = this.schemeName;
    data['convert_to_weight'] = this.convertToWeight;

    data['tax_type'] = this.taxType;
    data['tax_id'] = this.taxId;
    data['customer_name'] = this.customerName;
    data['mobile'] = this.mobile;
    data['paid_installments'] = this.paidInstallments;
    data['allow_advance'] = this.allowAdvance;
    data['advance_months'] = this.advanceMonths;
    data['total_installments'] = this.totalInstallments;
    data['paid_amount'] = this.paidAmount;
    data['paid_weight'] = this.paidWeight;
    data['last_paid_date'] = this.lastPaidDate;
    data['todays_rate'] = this.todaysRate;
    data['limit_type'] = this.limitType;
    data['payment_chance_type'] = this.paymentChanceType;
    data['payment_chance_value'] = this.paymentChanceValue;
    data['discount_type'] = this.discountType;
    data['discount_value'] = this.discountValue;
    data['denom_type'] = this.denomType;
    data['denom_value'] = this.denomValue;
    if (this.minimumPayable != null) {
      data['minimum_payable'] = this.minimumPayable!.toJson();
    }
    if (this.maximumPayable != null) {
      data['maximum_payable'] = this.maximumPayable!.toJson();
    }
    data['allow_pay'] = this.allowPay;
    if (this.amountDenom != null) {
      data['amount_denom'] = this.amountDenom!.map((v) => v.toJson()).toList();
    }
    if (this.weightDenom != null) {
      data['weight_denom'] = this.weightDenom!.map((v) => v.toJson()).toList();
    }
    data['for_search'] = this.forSearch;
    data['tax_percentage'] = this.taxPercentage;
    return data;
  }
}

class MinimumPayable {
  double? minAmount;
  double? minWeight;

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
  double? maxWeight;
  double? maxAmount;

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

class AmountDenom {
  int? id;
  String? value;
  int? sortOrder;
  String? createdOn;
  Null? updatedOn;
  int? idScheme;
  int? createdBy;
  Null? updatedBy;

  AmountDenom(
      {this.id,
      this.value,
      this.sortOrder,
      this.createdOn,
      this.updatedOn,
      this.idScheme,
      this.createdBy,
      this.updatedBy});

  AmountDenom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    sortOrder = json['sort_order'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    idScheme = json['id_scheme'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['sort_order'] = this.sortOrder;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['id_scheme'] = this.idScheme;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

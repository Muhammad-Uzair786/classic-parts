class EncashmentsModel {
  Encashments? encashments;

  EncashmentsModel({this.encashments});

  EncashmentsModel.fromJson(Map<String, dynamic> json) {
    encashments = json['encashments'] != null
        ? new Encashments.fromJson(json['encashments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.encashments != null) {
      data['encashments'] = this.encashments!.toJson();
    }
    return data;
  }
}

class Encashments {
  List<PendingEncashments>? pendingEncashments;
  List<SuccessfulEncashments>? successfulEncashments;
  List<RejectedEncashments>? rejectedEncashments;

  Encashments(
      {this.pendingEncashments,
        this.successfulEncashments,
        this.rejectedEncashments});

  Encashments.fromJson(Map<String, dynamic> json) {
    if (json['pending_encashments'] != null) {
      pendingEncashments = <PendingEncashments>[];
      json['pending_encashments'].forEach((v) {
        pendingEncashments!.add(new PendingEncashments.fromJson(v));
      });
    }
    if (json['successful_encashments'] != null) {
      successfulEncashments = <SuccessfulEncashments>[];
      json['successful_encashments'].forEach((v) {
        successfulEncashments!.add(new SuccessfulEncashments.fromJson(v));
      });
    }
    if (json['rejected_encashments'] != null) {
      rejectedEncashments = <RejectedEncashments>[];
      json['rejected_encashments'].forEach((v) {
        rejectedEncashments!.add(new RejectedEncashments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pendingEncashments != null) {
      data['pending_encashments'] =
          this.pendingEncashments!.map((v) => v.toJson()).toList();
    }
    if (this.successfulEncashments != null) {
      data['successful_encashments'] =
          this.successfulEncashments!.map((v) => v.toJson()).toList();
    }
    if (this.rejectedEncashments != null) {
      data['rejected_encashments'] =
          this.rejectedEncashments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingEncashments {
  int? id;
  int? userId;
  String? accountName;
  String? phoneNumber;
  int? amount;
  String? bank;
  String? createdAt;
  String? updatedAt;

  PendingEncashments(
      {this.id,
        this.userId,
        this.accountName,
        this.phoneNumber,
        this.amount,
        this.bank,
        this.createdAt,
        this.updatedAt});

  PendingEncashments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accountName = json['account_name'];
    phoneNumber = json['phone_number'];
    amount = json['amount'];
    bank = json['bank'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['account_name'] = this.accountName;
    data['phone_number'] = this.phoneNumber;
    data['amount'] = this.amount;
    data['bank'] = this.bank;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SuccessfulEncashments {
  int? id;
  int? userId;
  String? accountName;
  String? phoneNumber;
  int? amount;
  String? bank;
  String? transferId;
  String? createdAt;
  String? updatedAt;

  SuccessfulEncashments(
      {this.id,
        this.userId,
        this.accountName,
        this.phoneNumber,
        this.amount,
        this.bank,
        this.transferId,
        this.createdAt,
        this.updatedAt});

  SuccessfulEncashments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accountName = json['account_name'];
    phoneNumber = json['phone_number'];
    amount = json['amount'];
    bank = json['bank'];
    transferId = json['transfer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['account_name'] = this.accountName;
    data['phone_number'] = this.phoneNumber;
    data['amount'] = this.amount;
    data['bank'] = this.bank;
    data['transfer_id'] = this.transferId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RejectedEncashments {
  int? id;
  int? userId;
  String? accountName;
  String? phoneNumber;
  int? amount;
  String? bank;
  String? rejectionReason;
  String? createdAt;
  String? updatedAt;

  RejectedEncashments(
      {this.id,
        this.userId,
        this.accountName,
        this.phoneNumber,
        this.amount,
        this.bank,
        this.rejectionReason,
        this.createdAt,
        this.updatedAt});

  RejectedEncashments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accountName = json['account_name'];
    phoneNumber = json['phone_number'];
    amount = json['amount'];
    bank = json['bank'];
    rejectionReason = json['rejection_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['account_name'] = this.accountName;
    data['phone_number'] = this.phoneNumber;
    data['amount'] = this.amount;
    data['bank'] = this.bank;
    data['rejection_reason'] = this.rejectionReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

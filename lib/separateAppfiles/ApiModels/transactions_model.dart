class TransactionsModel {
  List<Transactions>? transactions;

  TransactionsModel({this.transactions});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  int? id;
  int? senderId;
  int? receiverId;
  int? amount;
  String? note;
  String? createdAt;
  String? updatedAt;
  Senders? senders;
  Receivers? receivers;

  Transactions(
      {this.id,
        this.senderId,
        this.receiverId,
        this.amount,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.senders,
        this.receivers});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    amount = json['amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senders =
    json['senders'] != null ? new Senders.fromJson(json['senders']) : null;
    receivers = json['receivers'] != null
        ? new Receivers.fromJson(json['receivers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['amount'] = this.amount;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.senders != null) {
      data['senders'] = this.senders!.toJson();
    }
    if (this.receivers != null) {
      data['receivers'] = this.receivers!.toJson();
    }
    return data;
  }
}

class Senders {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? imagePath;
  String? role;
  String? status;
  String? address;
  int? userCredit;
  int? userPoints;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  Senders(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.imagePath,
        this.role,
        this.status,
        this.address,
        this.userCredit,
        this.userPoints,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  Senders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
    role = json['role'];
    status = json['status'];
    address = json['address'];
    userCredit = json['user_credit'];
    userPoints = json['user_points'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image_path'] = this.imagePath;
    data['role'] = this.role;
    data['status'] = this.status;
    data['address'] = this.address;
    data['user_credit'] = this.userCredit;
    data['user_points'] = this.userPoints;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Receivers {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? imagePath;
  String? role;
  String? status;
  String? address;
  int? userCredit;
  Null? userPoints;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  Receivers(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.imagePath,
        this.role,
        this.status,
        this.address,
        this.userCredit,
        this.userPoints,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  Receivers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
    role = json['role'];
    status = json['status'];
    address = json['address'];
    userCredit = json['user_credit'];
    userPoints = json['user_points'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image_path'] = this.imagePath;
    data['role'] = this.role;
    data['status'] = this.status;
    data['address'] = this.address;
    data['user_credit'] = this.userCredit;
    data['user_points'] = this.userPoints;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

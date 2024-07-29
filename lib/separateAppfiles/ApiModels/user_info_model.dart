class UserInfoModel {
  Userinfo? userinfo;

  UserInfoModel({this.userinfo});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userinfo = json['Userinfo'] != null
        ? new Userinfo.fromJson(json['Userinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userinfo != null) {
      data['Userinfo'] = this.userinfo!.toJson();
    }
    return data;
  }
}

class Userinfo {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  String? imagePath;
  String? role;
  String? status;
  String? address;
  int? userCredit;
  int? userPoints;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  Userinfo(
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

  Userinfo.fromJson(Map<String, dynamic> json) {
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

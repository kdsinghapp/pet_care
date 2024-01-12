class SendOtpModel {
  SendOtpResult? result;
  String? message;
  String? status;

  SendOtpModel({this.result, this.message, this.status});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    result =
    json['status']!="0"? SendOtpResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class SendOtpResult {
  String? id;
  String? firstName;
  String? lastName;
  String? dob;
  String? email;
  String? password;
  String? image;
  String? registerId;
  String? socialId;
  String? type;
  String? status;
  String? token;
  String? expiredAt;
  String? lastLogin;
  String? dateTime;
  String? mobile;
  String? iosRegisterId;
  String? lat;
  String? lon;
  String? address;
  String? gender;
  String? age;
  String? category;
  String? otp;

  SendOtpResult(
      {this.id,
        this.firstName,
        this.lastName,
        this.dob,
        this.email,
        this.password,
        this.image,
        this.registerId,
        this.socialId,
        this.type,
        this.status,
        this.token,
        this.expiredAt,
        this.lastLogin,
        this.dateTime,
        this.mobile,
        this.iosRegisterId,
        this.lat,
        this.lon,
        this.address,
        this.gender,
        this.age,
        this.category,
        this.otp});

  SendOtpResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    registerId = json['register_id'];
    socialId = json['social_id'];
    type = json['type'];
    status = json['status'];
    token = json['token'];
    expiredAt = json['expired_at'];
    lastLogin = json['last_login'];
    dateTime = json['date_time'];
    mobile = json['mobile'];
    iosRegisterId = json['ios_register_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    gender = json['gender'];
    age = json['age'];
    category = json['category'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['dob'] = dob;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['register_id'] = registerId;
    data['social_id'] = socialId;
    data['type'] = type;
    data['status'] = status;
    data['token'] = token;
    data['expired_at'] = expiredAt;
    data['last_login'] = lastLogin;
    data['date_time'] = dateTime;
    data['mobile'] = mobile;
    data['ios_register_id'] = iosRegisterId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['address'] = address;
    data['gender'] = gender;
    data['age'] = age;
    data['category'] = category;
    data['otp'] = otp;
    return data;
  }
}

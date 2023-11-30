class UserData {
  UserData._privateConstructor();

  static final UserData _instance = UserData._privateConstructor();

  factory UserData() {
    return _instance;
  }

  UserModel user = UserModel();
}

class UserModel {
  int? status;
  String? message;
  String? memberName;
  String? memberCode;
  String? memberMobile;
  String? photo;

  UserModel(
      {this.status,
      this.message,
      this.memberName,
      this.memberCode,
      this.memberMobile,
      this.photo});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    memberName = json['member_name'];
    memberCode = json['member_code'];
    memberMobile = json['member_mobile'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['member_name'] = memberName;
    data['member_code'] = memberCode;
    data['member_mobile'] = memberMobile;
    data['photo'] = photo;
    return data;
  }
}

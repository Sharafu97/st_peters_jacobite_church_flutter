class MemberListModel {
  List<Members>? members;

  MemberListModel({this.members});

  MemberListModel.fromJson(Map<String, dynamic> json) {
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (members != null) {
      data['members'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Members {
  int? id;
  String? memberName;
  String? memberCode;
  String? memberMobile;
  String? photo;

  Members(
      {this.id,
      this.memberName,
      this.memberCode,
      this.memberMobile,
      this.photo});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberName = json['member_name'];
    memberCode = json['member_code'];
    memberMobile = json['member_mobile'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_name'] = memberName;
    data['member_code'] = memberCode;
    data['member_mobile'] = memberMobile;
    data['photo'] = photo;
    return data;
  }
}

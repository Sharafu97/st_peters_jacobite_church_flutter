import 'package:st_peters_jacobite_church_flutter/model/member_list_model.dart';

class SearchMembersModel {
  int? status;
  String? message;
  List<Members>? searchData;

  SearchMembersModel({this.status, this.message, this.searchData});

  SearchMembersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['search-data'] != null) {
      searchData = <Members>[];
      json['search-data'].forEach((v) {
        searchData!.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (searchData != null) {
      data['search-data'] = searchData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class SearchData {
//   int? id;
//   String? memberName;
//   String? memberCode;
//   String? memberMobile;
//   String? photo;
//   String? areaUnitId;
//   String? areaUnitName;
//   List<String>? familyMembers;

//   SearchData(
//       {this.id,
//       this.memberName,
//       this.memberCode,
//       this.memberMobile,
//       this.photo,
//       this.areaUnitId,
//       this.areaUnitName,
//       this.familyMembers});

//   SearchData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     memberName = json['member_name'];
//     memberCode = json['member_code'];
//     memberMobile = json['member_mobile'];
//     photo = json['photo'];
//     areaUnitId = json['area_unit_id'];
//     areaUnitName = json['area_unit_name'];
//     familyMembers = json['family_members'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['member_name'] = this.memberName;
//     data['member_code'] = this.memberCode;
//     data['member_mobile'] = this.memberMobile;
//     data['photo'] = this.photo;
//     data['area_unit_id'] = this.areaUnitId;
//     data['area_unit_name'] = this.areaUnitName;
//     data['family_members'] = this.familyMembers;
//     return data;
//   }
// }

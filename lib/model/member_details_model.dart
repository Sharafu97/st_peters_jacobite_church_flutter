class MemberDetailsModel {
  List<Member>? member;
  List<FamilyDetails>? familyDetails;

  MemberDetailsModel({this.member, this.familyDetails});

  MemberDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
    if (json['family_details'] != null) {
      familyDetails = <FamilyDetails>[];
      json['family_details'].forEach((v) {
        familyDetails!.add(FamilyDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    if (familyDetails != null) {
      data['family_details'] = familyDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  int? id;
  String? memberName;
  String? memberCode;
  String? memberMobile;
  String? photo;
  String? memberFatherName;
  String? memberCpr;
  String? memberHomeParish;
  String? memberDiocese;
  String? memberMaritalStatusId;
  String? memberMaritalStatus;
  String? memberCompanyAddress;
  String? memberIndiaAddress;
  String? memberEmailAddress;
  String? memberResPhone;
  String? memberOfficePhone;
  String? memberFax;
  String? memberWeddingDate;
  String? memberDateOfBirth;
  String? memberJoinedOnDate;
  String? memberFlatNo;
  String? memberRoadNo;
  String? memberArea;
  String? memberBuildingNo;
  String? memberBlockNo;
  String? memberMobile2;
  String? memberLocation;
  String? areaUnitId;
  String? areaUnitName;
  String? memberBloodGroupId;
  String? memberLandmark;
  String? memberLastConfessionDate;
  String? memberInsuranceNominee;
  String? memberIndiaPhone;
  String? memberPreferredPostalAddress;

  Member(
      {this.id,
      this.memberName,
      this.memberCode,
      this.memberMobile,
      this.photo,
      this.memberFatherName,
      this.memberCpr,
      this.memberHomeParish,
      this.memberDiocese,
      this.memberMaritalStatusId,
      this.memberMaritalStatus,
      this.memberCompanyAddress,
      this.memberIndiaAddress,
      this.memberEmailAddress,
      this.memberResPhone,
      this.memberOfficePhone,
      this.memberFax,
      this.memberWeddingDate,
      this.memberDateOfBirth,
      this.memberJoinedOnDate,
      this.memberFlatNo,
      this.memberRoadNo,
      this.memberArea,
      this.memberBuildingNo,
      this.memberBlockNo,
      this.memberMobile2,
      this.memberLocation,
      this.areaUnitId,
      this.areaUnitName,
      this.memberBloodGroupId,
      this.memberLandmark,
      this.memberLastConfessionDate,
      this.memberInsuranceNominee,
      this.memberIndiaPhone,
      this.memberPreferredPostalAddress});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberName = json['member_name'];
    memberCode = json['member_code'];
    memberMobile = json['member_mobile'];
    photo = json['photo'];
    memberFatherName = json['member_father_name'];
    memberCpr = json['member_cpr'];
    memberHomeParish = json['member_home_parish'];
    memberDiocese = json['member_diocese'];
    memberMaritalStatusId = json['member_marital_status_id'];
    memberMaritalStatus = json['member_marital_status'];
    memberCompanyAddress = json['member_company_address'];
    memberIndiaAddress = json['member_india_address'];
    memberEmailAddress = json['member_email_address'];
    memberResPhone = json['member_res_phone'];
    memberOfficePhone = json['member_office_phone'];
    memberFax = json['member_fax'];
    memberWeddingDate = json['member_wedding_date'];
    memberDateOfBirth = json['member_date_of_birth'];
    memberJoinedOnDate = json['member_joined_on_date'];
    memberFlatNo = json['member_flat_no'];
    memberRoadNo = json['member_road_no'];
    memberArea = json['member_area'];
    memberBuildingNo = json['member_building_no'];
    memberBlockNo = json['member_block_no'];
    memberMobile2 = json['member_mobile_2'];
    memberLocation = json['member_location'];
    areaUnitId = json['area_unit_id'];
    areaUnitName = json['area_unit_name'];
    memberBloodGroupId = json['member_blood_group_id'];
    memberLandmark = json['member_landmark'];
    memberLastConfessionDate = json['member_last_confession_date'];
    memberInsuranceNominee = json['member_insurance_nominee'];
    memberIndiaPhone = json['member_india_phone'];
    memberPreferredPostalAddress = json['member_preferred_postal_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_name'] = memberName;
    data['member_code'] = memberCode;
    data['member_mobile'] = memberMobile;
    data['photo'] = photo;
    data['member_father_name'] = memberFatherName;
    data['member_cpr'] = memberCpr;
    data['member_home_parish'] = memberHomeParish;
    data['member_diocese'] = memberDiocese;
    data['member_marital_status_id'] = memberMaritalStatusId;
    data['member_marital_status'] = memberMaritalStatus;
    data['member_company_address'] = memberCompanyAddress;
    data['member_india_address'] = memberIndiaAddress;
    data['member_email_address'] = memberEmailAddress;
    data['member_res_phone'] = memberResPhone;
    data['member_office_phone'] = memberOfficePhone;
    data['member_fax'] = memberFax;
    data['member_wedding_date'] = memberWeddingDate;
    data['member_date_of_birth'] = memberDateOfBirth;
    data['member_joined_on_date'] = memberJoinedOnDate;
    data['member_flat_no'] = memberFlatNo;
    data['member_road_no'] = memberRoadNo;
    data['member_area'] = memberArea;
    data['member_building_no'] = memberBuildingNo;
    data['member_block_no'] = memberBlockNo;
    data['member_mobile_2'] = memberMobile2;
    data['member_location'] = memberLocation;
    data['area_unit_id'] = areaUnitId;
    data['area_unit_name'] = areaUnitName;
    data['member_blood_group_id'] = memberBloodGroupId;
    data['member_landmark'] = memberLandmark;
    data['member_last_confession_date'] = memberLastConfessionDate;
    data['member_insurance_nominee'] = memberInsuranceNominee;
    data['member_india_phone'] = memberIndiaPhone;
    data['member_preferred_postal_address'] = memberPreferredPostalAddress;
    return data;
  }
}

class FamilyDetails {
  String? id;
  String? name;
  String? relationship;
  String? homeParish;
  String? officeAddress;
  String? dateOfBirth;
  String? cprNumber;
  String? occupation;
  String? photo;
  String? location;
  String? mobile;
  String? emailAddress;
  String? bloodGroupId;
  String? bloodGroup;

  FamilyDetails(
      {this.id,
      this.name,
      this.relationship,
      this.homeParish,
      this.officeAddress,
      this.dateOfBirth,
      this.cprNumber,
      this.occupation,
      this.photo,
      this.location,
      this.mobile,
      this.emailAddress,
      this.bloodGroupId,
      this.bloodGroup});

  FamilyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    relationship = json['relationship'];
    homeParish = json['home_parish'];
    officeAddress = json['office_address'];
    dateOfBirth = json['date_of_birth'];
    cprNumber = json['cpr_number'];
    occupation = json['occupation'];
    photo = json['photo'];
    location = json['location'];
    mobile = json['mobile'];
    emailAddress = json['email_address'];
    bloodGroupId = json['blood_group_id'];
    bloodGroup = json['blood_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['relationship'] = relationship;
    data['home_parish'] = homeParish;
    data['office_address'] = officeAddress;
    data['date_of_birth'] = dateOfBirth;
    data['cpr_number'] = cprNumber;
    data['occupation'] = occupation;
    data['photo'] = photo;
    data['location'] = location;
    data['mobile'] = mobile;
    data['email_address'] = emailAddress;
    data['blood_group_id'] = bloodGroupId;
    data['blood_group'] = bloodGroup;
    return data;
  }
}

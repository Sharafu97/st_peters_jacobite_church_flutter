class SpiritualOrgModel {
  List<SpiritualOrganizations>? spiritualOrganizations;

  SpiritualOrgModel({this.spiritualOrganizations});

  SpiritualOrgModel.fromJson(Map<String, dynamic> json) {
    if (json['spiritual-organizations'] != null) {
      spiritualOrganizations = <SpiritualOrganizations>[];
      json['spiritual-organizations'].forEach((v) {
        spiritualOrganizations!.add(SpiritualOrganizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (spiritualOrganizations != null) {
      data['spiritual-organizations'] =
          spiritualOrganizations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpiritualOrganizations {
  int? id;
  String? organizationName;
  String? organizationDetails;
  String? coordinatorName1;
  String? coordinatorDesignation1;
  String? coordinatorPhone1;
  String? coordinatorPhoto1;
  String? coordinatorName2;
  String? coordinatorDesignation2;
  String? coordinatorPhone2;
  String? coordinatorPhoto2;

  SpiritualOrganizations(
      {this.id,
      this.organizationName,
      this.organizationDetails,
      this.coordinatorName1,
      this.coordinatorDesignation1,
      this.coordinatorPhone1,
      this.coordinatorPhoto1,
      this.coordinatorName2,
      this.coordinatorDesignation2,
      this.coordinatorPhone2,
      this.coordinatorPhoto2});

  SpiritualOrganizations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationName = json['organization_name'];
    organizationDetails = json['organization_details'];
    coordinatorName1 = json['coordinator_name1'];
    coordinatorDesignation1 = json['coordinator_designation1'];
    coordinatorPhone1 = json['coordinator_phone1'];
    coordinatorPhoto1 = json['coordinator_photo1'];
    coordinatorName2 = json['coordinator_name2'];
    coordinatorDesignation2 = json['coordinator_designation2'];
    coordinatorPhone2 = json['coordinator_phone2'];
    coordinatorPhoto2 = json['coordinator_photo2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['organization_name'] = organizationName;
    data['organization_details'] = organizationDetails;
    data['coordinator_name1'] = coordinatorName1;
    data['coordinator_designation1'] = coordinatorDesignation1;
    data['coordinator_phone1'] = coordinatorPhone1;
    data['coordinator_photo1'] = coordinatorPhoto1;
    data['coordinator_name2'] = coordinatorName2;
    data['coordinator_designation2'] = coordinatorDesignation2;
    data['coordinator_phone2'] = coordinatorPhone2;
    data['coordinator_photo2'] = coordinatorPhoto2;
    return data;
  }
}

class AreaUnitsModel {
  List<AreaUnits>? areaUnits;

  AreaUnitsModel({this.areaUnits});

  AreaUnitsModel.fromJson(Map<String, dynamic> json) {
    if (json['area_units'] != null) {
      areaUnits = <AreaUnits>[];
      json['area_units'].forEach((v) {
        areaUnits!.add(new AreaUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.areaUnits != null) {
      data['area_units'] = this.areaUnits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaUnits {
  int? id;
  String? areaName;
  String? meetingDay;
  String? areaUnits;
  String? femaleCoordinatorName;
  String? femaleCoordinatorPhone;
  String? femaleCoordinatorPhoto;
  String? maleCoordinatorName;
  String? maleCoordinatorPhone;
  String? maleCoordinatorPhoto;

  AreaUnits(
      {this.id,
      this.areaName,
      this.meetingDay,
      this.areaUnits,
      this.femaleCoordinatorName,
      this.femaleCoordinatorPhone,
      this.femaleCoordinatorPhoto,
      this.maleCoordinatorName,
      this.maleCoordinatorPhone,
      this.maleCoordinatorPhoto});

  AreaUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
    meetingDay = json['meeting_day'];
    areaUnits = json['area_units'];
    femaleCoordinatorName = json['female_coordinator_name'];
    femaleCoordinatorPhone = json['female_coordinator_phone'];
    femaleCoordinatorPhoto = json['female_coordinator_photo'];
    maleCoordinatorName = json['male_coordinator_name'];
    maleCoordinatorPhone = json['male_coordinator_phone'];
    maleCoordinatorPhoto = json['male_coordinator_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_name'] = this.areaName;
    data['meeting_day'] = this.meetingDay;
    data['area_units'] = this.areaUnits;
    data['female_coordinator_name'] = this.femaleCoordinatorName;
    data['female_coordinator_phone'] = this.femaleCoordinatorPhone;
    data['female_coordinator_photo'] = this.femaleCoordinatorPhoto;
    data['male_coordinator_name'] = this.maleCoordinatorName;
    data['male_coordinator_phone'] = this.maleCoordinatorPhone;
    data['male_coordinator_photo'] = this.maleCoordinatorPhoto;
    return data;
  }
}

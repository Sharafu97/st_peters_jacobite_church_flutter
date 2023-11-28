class AreaUnitsModel {
  List<AreaUnits>? areaUnits;

  AreaUnitsModel({this.areaUnits});

  AreaUnitsModel.fromJson(Map<String, dynamic> json) {
    if (json['area_units'] != null) {
      areaUnits = <AreaUnits>[];
      json['area_units'].forEach((v) {
        areaUnits!.add(AreaUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (areaUnits != null) {
      data['area_units'] = areaUnits!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['area_name'] = areaName;
    data['meeting_day'] = meetingDay;
    data['area_units'] = areaUnits;
    data['female_coordinator_name'] = femaleCoordinatorName;
    data['female_coordinator_phone'] = femaleCoordinatorPhone;
    data['female_coordinator_photo'] = femaleCoordinatorPhoto;
    data['male_coordinator_name'] = maleCoordinatorName;
    data['male_coordinator_phone'] = maleCoordinatorPhone;
    data['male_coordinator_photo'] = maleCoordinatorPhoto;
    return data;
  }
}

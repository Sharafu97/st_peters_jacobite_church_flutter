class CommitteeModel {
  int? status;
  String? message;
  List<CommitteeMember>? president;
  List<CommitteeMember>? committees;
  List<CommitteeMember>? committeeMember;
  List<CommitteeMember>? auditors;

  CommitteeModel({
    this.status,
    this.message,
    this.president,
    this.committees,
    this.committeeMember,
    this.auditors,
  });

  CommitteeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['president'] != null) {
      president = <CommitteeMember>[];
      json['president'].forEach((v) {
        president!.add(CommitteeMember.fromJson(v));
      });
    }
    if (json['committees'] != null) {
      committees = <CommitteeMember>[];
      json['committees'].forEach((v) {
        committees!.add(CommitteeMember.fromJson(v));
      });
    }
    if (json['committee-member'] != null) {
      committeeMember = <CommitteeMember>[];
      json['committee-member'].forEach((v) {
        committeeMember!.add(CommitteeMember.fromJson(v));
      });
    }
    if (json['auditors'] != null) {
      auditors = <CommitteeMember>[];
      json['auditors'].forEach((v) {
        auditors!.add(CommitteeMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (president != null) {
      data['president'] = president!.map((v) => v.toJson()).toList();
    }
    if (committees != null) {
      data['committees'] = committees!.map((v) => v.toJson()).toList();
    }
    if (committeeMember != null) {
      data['committee-member'] =
          committeeMember!.map((v) => v.toJson()).toList();
    }
    if (auditors != null) {
      data['auditors'] = auditors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommitteeMember {
  int? id;
  String? personName;
  String? memberId;
  String? designation;
  String? photo;

  CommitteeMember(
      {this.id, this.personName, this.memberId, this.designation, this.photo});

  CommitteeMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personName = json['person_name'];
    memberId = json['member_id'];
    designation = json['designation'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['person_name'] = personName;
    data['member_id'] = memberId;
    data['designation'] = designation;
    data['photo'] = photo;
    return data;
  }
}

class DownloadModel {
  List<Downloads>? downloads;

  DownloadModel({this.downloads});

  DownloadModel.fromJson(Map<String, dynamic> json) {
    if (json['downloads'] != null) {
      downloads = <Downloads>[];
      json['downloads'].forEach((v) {
        downloads!.add(Downloads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (downloads != null) {
      data['downloads'] = downloads!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Downloads {
  int? id;
  String? title;
  String? fileId;
  String? fileType;
  String? phots;

  Downloads({this.id, this.title, this.fileId, this.fileType, this.phots});

  Downloads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    fileId = json['file_id'];
    fileType = json['file_type'];
    phots = json['phots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['file_id'] = fileId;
    data['file_type'] = fileType;
    data['phots'] = phots;
    return data;
  }
}

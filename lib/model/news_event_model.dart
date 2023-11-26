class NewsEventModel {
  int? status;
  String? message;
  List<NewsEvents>? newsEvents;

  NewsEventModel({this.status, this.message, this.newsEvents});

  NewsEventModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['news-events'] != null) {
      newsEvents = <NewsEvents>[];
      json['news-events'].forEach((v) {
        newsEvents!.add(NewsEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (newsEvents != null) {
      data['news-events'] = newsEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsEvents {
  int? id;
  String? newsTitle;
  String? newsDetails;
  String? publishingDate;
  List<String>? phots;

  NewsEvents(
      {this.id,
      this.newsTitle,
      this.newsDetails,
      this.publishingDate,
      this.phots});

  NewsEvents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsTitle = json['news_title'];
    newsDetails = json['news_details'];
    publishingDate = json['publishing_date'];
    phots = json['phots'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['news_title'] = newsTitle;
    data['news_details'] = newsDetails;
    data['publishing_date'] = publishingDate;
    data['phots'] = phots;
    return data;
  }
}

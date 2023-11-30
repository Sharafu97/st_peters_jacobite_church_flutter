import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/model/news_event_model.dart';
import 'package:st_peters_jacobite_church_flutter/network/repository/repository.dart';

class NewsEventsNotifier extends ChangeNotifier {
  ApiStatus _status = ApiStatus.INITIALIZE;
  List<NewsEvents> _news = [];
  List<NewsEvents> _topNews = [];
  String _error = '';

  ApiStatus get status => _status;
  List<NewsEvents> get news => _news;
  List<NewsEvents> get topNews => _topNews;
  String get error => _error;

  Future<void> getNewsAndEvents() async {
    try {
      notifyState(ApiStatus.LOADING);
      final newsRes = await AppRepository().getNewsAndEvents();
      final topNewsRes = await AppRepository().getTopNewsAndEvents();
      _news = newsRes?.newsEvents ?? [];
      _topNews = topNewsRes?.newsEvents ?? [];

      notifyState(ApiStatus.SUCCESS);
    } catch (e) {
      _error = e.toString();
      notifyState(ApiStatus.FAILED);
    }
  }

  void notifyState(ApiStatus st) {
    _status = st;
    notifyListeners();
  }
}

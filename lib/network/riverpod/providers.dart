import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/areaunits_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/download_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/login_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/member_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/news_events_notifier.dart';

final memberProvider = ChangeNotifierProvider((ref) => MemberNotifier());
final areaUnitsProvider = ChangeNotifierProvider((ref) => AreaUnitsNotifier());
final downloadProvider = ChangeNotifierProvider((ref) => DownloadNotifier());
final loginProvider = ChangeNotifierProvider((ref) => LoginNotifier());
final newsEventsProvider =
    ChangeNotifierProvider((ref) => NewsEventsNotifier());

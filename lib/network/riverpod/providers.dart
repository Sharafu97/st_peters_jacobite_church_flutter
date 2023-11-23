import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/member_notifier.dart';

final memberProvider = ChangeNotifierProvider((ref) => MemberNotifier());

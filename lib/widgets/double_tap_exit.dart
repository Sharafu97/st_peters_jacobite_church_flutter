import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';

class DoubleBackToCloseWidget extends StatefulWidget {
  final Widget child; // Make Sure this child has a Scaffold widget as parent.

  const DoubleBackToCloseWidget({
    super.key,
    required this.child,
  });

  @override
  State<DoubleBackToCloseWidget> createState() =>
      _DoubleBackToCloseWidgetState();
}

class _DoubleBackToCloseWidgetState extends State<DoubleBackToCloseWidget> {
  int _lastTimeBackButtonWasTapped = 0;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => !AppConstants().isIOS;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return PopScope(
        canPop: false,
        onPopInvoked: (val) {
          _handleWillPop();
        },
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  void _handleWillPop() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if ((currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      _lastTimeBackButtonWasTapped = 10;

      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      SystemNavigator.pop();
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      snackBar(context, content: 'Press back again to exit!');
    }
  }
}

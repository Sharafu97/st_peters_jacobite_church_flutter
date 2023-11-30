import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final _duration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(authProvider).init();
    });

    _animationController =
        AnimationController(vsync: this, duration: _duration);

    _animation = Tween(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController
        .forward()
        .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation as Animation<double>,
          child: FadeTransition(
            opacity: _animation as Animation<double>,
            child: SizedBox(
              child: Image.asset(
                AppAssets.imageTopLogos,
                scale: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

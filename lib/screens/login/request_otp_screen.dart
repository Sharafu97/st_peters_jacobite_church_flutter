import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/validators.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/login_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/button.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/textfield.dart';

class RequestOTPScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  RequestOTPScreen({super.key});

  void _login(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      ref.read(loginProvider).login(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    _loginListener(ref, context);
    return Scaffold(
      appBar: const CustomAppbar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.15,
                child: Image.asset(
                  AppAssets.imageLogoWatermark,
                  width: constraints.maxWidth,
                  scale: 2,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.extraLargePadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter your member ID',
                          style: textStyle.bodyLarge!.copyWith(
                            fontFamily: AppConstants.fontGotham,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: AppConstants.extraLargePadding),
                        CustomTextField(
                          controller: _controller,
                          validator: requiredValidator(),
                        ),
                        const SizedBox(height: AppConstants.largePadding),
                        Material(
                          child: Consumer(builder: (_, ref, __) {
                            final data = ref.watch(loginProvider);
                            return CustomButton(
                              text: 'Get OTP',
                              isLoading: data.loginStatus == ApiStatus.LOADING,
                              onPressed: () {
                                _login(ref);
                              },
                              width: 150,
                            );
                          }),
                        ),
                        const SizedBox(height: AppConstants.defaultPadding),
                        Text(
                          'OTP will be sent to your email\nassociated with your member ID',
                          textAlign: TextAlign.center,
                          style: textStyle.bodySmall!.copyWith(
                            fontFamily: AppConstants.fontGotham,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // _loginListener(ref, context),
            ],
          ),
        );
      }),
    );
  }

  void _loginListener(WidgetRef ref, BuildContext context) {
    ref.listen<LoginNotifier>(loginProvider, (previous, next) {
      if (next.loginStatus == ApiStatus.SUCCESS) {
        Navigator.pushNamed(context, AppRoutes.verifyOTP,
            arguments: _controller.text);
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
      if (next.loginStatus == ApiStatus.FAILED) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.error)));
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
    });
    // return const SizedBox.shrink();
  }
}

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
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/textfield.dart';

class VerifyOTPScreen extends ConsumerStatefulWidget {
  const VerifyOTPScreen({super.key, required this.param});
  final VerifyOtpParam param;

  @override
  ConsumerState<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  void _verifyOtp() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(loginProvider)
          .verifyOtp(widget.param.memberCode, _controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    _loginListener();
    return Scaffold(
      appBar: const CustomAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                            'Enter the code recieved in your\nregistered email address',
                            style: textStyle.bodyLarge!.copyWith(
                              fontFamily: AppConstants.fontGotham,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                              height: AppConstants.extraLargePadding),
                          CustomTextField(
                            controller: _controller,
                            validator: requiredValidator().call,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: AppConstants.largePadding),
                          Material(
                            child: Consumer(builder: (_, ref, __) {
                              final data = ref.watch(loginProvider);
                              return CustomButton(
                                text: 'VERIFY',
                                isLoading:
                                    data.verifyStatus == ApiStatus.LOADING,
                                onPressed: _verifyOtp,
                                width: 150,
                              );
                            }),
                          ),
                          const SizedBox(height: AppConstants.defaultPadding),
                          Text(
                            'Didn\'t recieve your code?',
                            textAlign: TextAlign.center,
                            style: textStyle.bodySmall!.copyWith(
                              fontFamily: AppConstants.fontGotham,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Consumer(builder: (_, ref, __) {
                            final data = ref.watch(loginProvider);
                            return CustomTextButton(
                              onPressed: () {
                                ref.read(loginProvider).login(
                                    widget.param.memberCode,
                                    resend: true);
                              },
                              isLoading:
                                  data.loginStatus == ApiStatus.LOADING &&
                                      data.resend,
                              text: 'RESEND OTP',
                              width: 170,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _loginListener() {
    ref.listen<LoginNotifier>(loginProvider, (previous, next) {
      if (next.verifyStatus == ApiStatus.SUCCESS) {
        snackBar(context, content: 'Login successful.');

        if (widget.param.isFromDrawer) {
          Navigator.pop(context);
        } else {
          Navigator.popAndPushNamed(context, AppRoutes.members);
        }
        next.notifyVerifyState(ApiStatus.INITIALIZE);
      }
      if (next.verifyStatus == ApiStatus.FAILED) {
        snackBar(context, content: next.error);
      }
      if (next.loginStatus == ApiStatus.SUCCESS && next.resend) {
        snackBar(context, content: 'New OTP is sent successfully.');
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
      if (next.loginStatus == ApiStatus.FAILED && next.resend) {
        snackBar(context, content: next.error);
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
    });
  }
}

class VerifyOtpParam {
  VerifyOtpParam({
    required this.memberCode,
    required this.isFromDrawer,
  });
  final String memberCode;
  final bool isFromDrawer;
}

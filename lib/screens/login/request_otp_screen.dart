import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/validators.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/login_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/screens/login/verify_otp_screen.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/button.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/textfield.dart';

class RequestOTPScreen extends ConsumerStatefulWidget {
  const RequestOTPScreen({super.key, required this.isFromDrawer});
  final bool isFromDrawer;

  @override
  ConsumerState<RequestOTPScreen> createState() => _RequestOTPScreenState();
}

class _RequestOTPScreenState extends ConsumerState<RequestOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _isConsentChecked = false;
  void _login(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      if (_isConsentChecked) {
        ref.read(loginProvider).login(_controller.text);
      } else {
        snackBar(context,
            content: 'Please agree to the consent statement to continue.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        horizontal: AppConstants.defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter your member ID\n to get started',
                          style: textStyle.bodyLarge!.copyWith(
                            fontFamily: AppConstants.fontGotham,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppConstants.extraLargePadding),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.defaultPadding),
                          child: CustomTextField(
                            controller: _controller,
                            validator: requiredValidator(),
                          ),
                        ),
                        const SizedBox(height: AppConstants.largePadding),
                        Text(
                          'An OTP will be sent to your email\nassociated with your member ID',
                          textAlign: TextAlign.center,
                          style: textStyle.bodyMedium!.copyWith(
                            fontFamily: AppConstants.fontGotham,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: AppConstants.largePadding),
                        Material(
                          child: Consumer(builder: (_, ref, __) {
                            final data = ref.watch(loginProvider);
                            return CustomButton(
                              text: 'PROCEED',
                              isLoading:
                                  (data.loginStatus == ApiStatus.LOADING &&
                                      !data.resend),
                              onPressed: () {
                                _login(ref);
                              },
                              width: 150,
                            );
                          }),
                        ),
                        const SizedBox(height: AppConstants.defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox.adaptive(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  activeColor: AppColors.brown41210A,
                                  value: _isConsentChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isConsentChecked = value ?? false;
                                    });
                                  }),
                            ),
                            const SizedBox(width: AppConstants.smallPadding),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: 'I have read and agree to the ',
                                  style: textStyle.bodySmall!.copyWith(
                                    fontFamily: AppConstants.fontGotham,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => Navigator.pushNamed(
                                            context, AppRoutes.webView,
                                            arguments:
                                                AppConstants.termsOfUseURL),
                                        child: Text(
                                          'terms & conditions',
                                          style: textStyle.bodySmall!.copyWith(
                                            fontFamily: AppConstants.fontGotham,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: textStyle.bodySmall!.copyWith(
                                        fontFamily: AppConstants.fontGotham,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => Navigator.pushNamed(
                                            context, AppRoutes.webView,
                                            arguments:
                                                AppConstants.privacyPolicyURL),
                                        child: Text(
                                          'privacy policy.',
                                          style: textStyle.bodySmall!.copyWith(
                                            fontFamily: AppConstants.fontGotham,
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _loginListener(WidgetRef ref, BuildContext context) {
    ref.listen<LoginNotifier>(loginProvider, (previous, next) {
      if (next.loginStatus == ApiStatus.SUCCESS && !next.resend) {
        final param = VerifyOtpParam(
            memberCode: _controller.text, isFromDrawer: widget.isFromDrawer);
        Navigator.popAndPushNamed(context, AppRoutes.verifyOTP,
            arguments: param);
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
      if (next.loginStatus == ApiStatus.FAILED && !next.resend) {
        snackBar(context, content: next.error);
      }
    });
  }
}

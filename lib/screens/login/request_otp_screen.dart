import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/enums.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/validators.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/notifiers/login_notifier.dart';
import 'package:st_peters_jacobite_church_flutter/network/riverpod/providers.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/button.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/costom_snackbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/textfield.dart';

class RequestOTPScreen extends ConsumerStatefulWidget {
  const RequestOTPScreen({super.key});

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
        // Navigator.pushNamed(context, AppRoutes.verifyOTP,
        //     arguments: _controller.text);
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
                              text: 'PRODEED',
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
                          children: [
                            Checkbox.adaptive(
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
                            Expanded(
                              child: Text(
                                'I have read and agree to the terms & conditions\nand privacy policy.',
                                style: textStyle.bodySmall!.copyWith(
                                  fontFamily: AppConstants.fontGotham,
                                  fontWeight: FontWeight.w400,
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
        Navigator.pushNamed(context, AppRoutes.verifyOTP,
            arguments: _controller.text);
        next.notifyLoginState(ApiStatus.INITIALIZE);
      }
      if (next.loginStatus == ApiStatus.FAILED && !next.resend) {
        snackBar(context, content: next.error);
      }
    });
  }
}

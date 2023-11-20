import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/config/routes.dart';
import 'package:st_peters_jacobite_church_flutter/config/utils/validators.dart';
import 'package:st_peters_jacobite_church_flutter/theme/assets.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/appbar.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/button.dart';
import 'package:st_peters_jacobite_church_flutter/widgets/textfield.dart';

class RequestOTPScreen extends StatefulWidget {
  const RequestOTPScreen({Key? key}) : super(key: key);

  @override
  State<RequestOTPScreen> createState() => _RequestOTPScreenState();
}

class _RequestOTPScreenState extends State<RequestOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
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
                        CustomButton(
                          text: 'Get OTP',
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.verifyOTP),
                          width: 150,
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
              )
            ],
          ),
        );
      }),
    );
  }
}

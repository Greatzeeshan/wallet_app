import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../widgets/custom_button_widget.dart';
import 'verification_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizeHelper.h20,
              SvgPicture.asset(welcomeSVG),
              SizeHelper.h20,
              SizeHelper.h20,
              const Text(
                "Hello Militao!",
                style: StyleHelper.b18,
                textAlign: TextAlign.center,
              ),
              SizeHelper.h10,
              const Text(
                "Welcome to DigiWallet",
                style: StyleHelper.b18,
                textAlign: TextAlign.center,
              ),
              SizeHelper.h10,
              Text(
                "It's great to have you here",
                style: StyleHelper.n14.copyWith(color: ColorHelper.textColor),
                textAlign: TextAlign.center,
              ),
              SizeHelper.h20,
              SizeHelper.h10,
              CustomButton(
                text: 'Submit',
                func: () {
                  Get.to(const VerificationScreen());
                },
              ),
              SizeHelper.h20,
            ],
          ),
        ),
      ),
    );
  }
}

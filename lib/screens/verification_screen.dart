import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';

import '../nav_bar.dart';
import '../utils/size_helper.dart';
import '../utils/style_helper.dart';
import '../widgets/custom_button_widget.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorHelper.textColor,
            size: 25,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizeHelper.h20,
              const Text(
                "Profile Verification",
                style: StyleHelper.b18,
                textAlign: TextAlign.center,
              ),
              SizeHelper.h20,
              Text(
                "Unlock all features by verifying your identity",
                style: StyleHelper.n14.copyWith(color: ColorHelper.textColor),
                textAlign: TextAlign.center,
              ),
              SizeHelper.h20,
              SvgPicture.asset(faceSVG),
              
              SizeHelper.h20,
              SizeHelper.h20,
              CustomButton(
                text: 'Continue',
                func: () {
                  Get.to(const NavBarPage());
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

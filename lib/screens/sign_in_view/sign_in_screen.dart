import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../../utils/color_helper.dart';

import 'continue_widget.dart';
import 'login_widget.dart';
import 'social_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
            ),
            child: ListView(
              children: [
                SizeHelper.h20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      logoSVG,
                      width: 30,
                      height: 30,
                      fit: BoxFit.fill,
                    ),
                    SizeHelper.w3,
                    const Text(
                      "Digi-Wallet",
                      style: StyleHelper.b20,
                    ),
                  ],
                ),
                SizeHelper.h20,
                const Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: StyleHelper.b18,
                ),
                SizeHelper.h20,
                Text(
                  "Fill all information to continue our app and enjoy our services",
                  style: StyleHelper.n14.copyWith(
                    color: ColorHelper.textColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                SizeHelper.h20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialWidget(
                      icon: googleSVG,
                      width: size.width * 0.40,
                    ),
                    SocialWidget(
                      icon: appleSVG,
                      width: size.width * 0.40,
                    ),
                  ],
                ),
                SizeHelper.h20,
                const ContinueWidget(),
                SizeHelper.h20,
                const LoginFormWidget(),
                SizeHelper.h20,
                SizeHelper.h20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account? ",
                      style: StyleHelper.n14
                          .copyWith(color: ColorHelper.textColor),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Signup",
                          style: StyleHelper.n14
                              .copyWith(color: ColorHelper.mainColor),
                        )),
                  ],
                ),
                SizeHelper.h20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../../utils/size_helper.dart';
import '../../widgets/custom_button_widget.dart';
import '../welcome_screen.dart';
import 'input_decoration.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: StyleHelper.n14,
          ),
          SizeHelper.h5,
          SizeHelper.h3,
          TextFormField(
            autocorrect: false,
            style: StyleHelper.n14,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
                if (value!.isEmpty) {
                return 'Email is Required';
              }
              if (!RegExp(
                      r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                  .hasMatch(value)) {
                return 'Please enter a valid Email';
              }
              return null;
            },
            decoration: inputDecoration.copyWith(
              hintText: 'enter email address',
              hintStyle: StyleHelper.n14,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  mailSVG,
                  color: ColorHelper.splashColor,
                ),
              ),
            ),
          ),
          SizeHelper.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Password",
                style: StyleHelper.n14,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: StyleHelper.n14.copyWith(color: ColorHelper.textColor),
                ),
              ),
            ],
          ),
          SizeHelper.h5,
          SizeHelper.h3,
          TextFormField(
            autocorrect: false,
            style: StyleHelper.n14,
            controller: _passwordController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password Required*';
              } else if (value.length < 6) {
                return 'Password must contains 6 digits';
              }
              return null;
            },
            decoration: inputDecoration.copyWith(
              hintText: 'enter password',
              hintStyle: StyleHelper.n14,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  lockSVG,
                  color: ColorHelper.splashColor,
                ),
              ),
            ),
            obscureText: true,
          ),
          SizeHelper.h20,
          CustomButton(
            text: 'Sign In',
            func: () {
              if (_formKey.currentState!.validate()) {
                log("validated");
                Get.to(const WelcomeScreen());
              }else{
                log("not validated");
              }
            },
          ),
        ],
      ),
    );
  }
}

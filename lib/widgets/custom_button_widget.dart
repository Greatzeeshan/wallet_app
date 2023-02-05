import 'package:flutter/material.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function func;
  final double? width;
  const CustomButton(
      {super.key, required this.text, required this.func, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: width ?? double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorHelper.mainColor,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: StyleHelper.n14
              .copyWith(color: ColorHelper.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

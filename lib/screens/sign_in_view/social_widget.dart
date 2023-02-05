import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/utils/color_helper.dart';

class SocialWidget extends StatelessWidget {
  final String icon;
  final double width;
  const SocialWidget({super.key, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.5, color: ColorHelper.grey500)),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        icon,
        width: 30,
        height: 30,
      ),
    );
  }
}

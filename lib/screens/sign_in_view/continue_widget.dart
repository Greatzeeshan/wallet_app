import 'package:flutter/material.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/size_helper.dart';

import '../../utils/style_helper.dart';

class ContinueWidget extends StatelessWidget {
  const ContinueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customRow(),
        SizeHelper.w5,
        SizeHelper.w3,
        Text(
          "Or continue with",
          style: StyleHelper.n14.copyWith(color: ColorHelper.textColor),
        ),
        SizeHelper.w5,
        SizeHelper.w3,
        customRow(),
      ],
    );
  }

  Widget customRow() {
    return Expanded(
      child: Container(height: 1.5, color: ColorHelper.grey500),
    );
  }
}

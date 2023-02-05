import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/style_helper.dart';

class ThemeChangeWidget extends StatefulWidget {
  const ThemeChangeWidget({super.key});

  @override
  State<ThemeChangeWidget> createState() => _ThemeChangeWidgetState();
}

class _ThemeChangeWidgetState extends State<ThemeChangeWidget> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    if (Get.isDarkMode) {
      setState(() {
        isDarkMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Dark Mode',
          style: StyleHelper.b14,
        ),
        const Spacer(),
        Transform.scale(
          transformHitTests: false,
          scale: 0.6,
          child: SizedBox(
            width: 30,
            height: 20,
            child: CupertinoSwitch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                    Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                  });
                }),
          ),
        )
      ],
    );
  }
}

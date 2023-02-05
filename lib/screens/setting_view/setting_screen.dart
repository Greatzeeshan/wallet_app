import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/size_helper.dart';

import '../../utils/color_helper.dart';
import '../../utils/style_helper.dart';
import 'theme_change_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorHelper.textColor,
                    size: 25,
                  ),
                ),
                const Text(
                  'Settings',
                  style: StyleHelper.b18,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading('General'),
              const ThemeChangeWidget(),
              SizeHelper.h10,
              itemWidget('Notifications'),
              itemWidget('Reset Password'),
              SizeHelper.h15,
              leading('About Digiwallet'),
              itemWidget('Disclosure'),
              itemWidget('Privacy & Security'),
              itemWidget('Feedback'),
              SizeHelper.h10,
              Text(
          'Log Out',
          style: StyleHelper.b14.copyWith(color: ColorHelper.mainColor),
        ),
            ],
          ),
        ),
      ),
    );
  }

  itemWidget(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(title,style: StyleHelper.b14,),
          const Spacer(),
          const Icon(
              Icons.arrow_forward_ios,
              color: ColorHelper.textColor,
              size: 15,
            ),
        ],
      ),
    );
  }

  leading(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleHelper.b14.copyWith(color: ColorHelper.textColor),
        ),
        SizeHelper.h10,
        const Divider(
          height: 1,
          color: ColorHelper.grey500,
        ),
        SizeHelper.h15,
      ],
    );
  }
}

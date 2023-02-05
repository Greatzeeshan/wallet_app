import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet_app/models/notification_model.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/size_helper.dart';

import '../../utils/color_helper.dart';
import '../../utils/style_helper.dart';
import '../money_request_view/money_request_screen.dart';
import '../setting_view/setting_screen.dart';

// ignore: must_be_immutable
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  List<NotificationModel> todayList = [
    NotificationModel(
        discountSVG, 'Cashback 50%', 'Get the 50% cashback for the next top-up'),
    NotificationModel(bookmarkSVG, 'New extra deposit offer',
        'Only this weekend we have special offer for you'),
  ];

  List<NotificationModel> yesterdayList = [
    NotificationModel(dollarSVG, 'Salary income',
        'American multinational technology company'),
    NotificationModel(changeSVG, 'Change your card to new one',
        'Your card will be undupported into few weeks'),
    NotificationModel(arrowdownSVG, 'Return', 'Ferniture store'),
    NotificationModel(tickSVG, 'Lottery win', 'Lottery NYC'),
  ];

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
                  'Notification',
                  style: StyleHelper.b18,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const SettingScreen());
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 25,
                    color: ColorHelper.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizeHelper.h15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Today',
                      style: StyleHelper.n14
                          .copyWith(color: ColorHelper.textColor),
                    ),
                    Text(
                      'Mark as Read',
                      textAlign: TextAlign.end,
                      style: StyleHelper.n14
                          .copyWith(color: ColorHelper.mainColor),
                    )
                  ],
                ),
                SizeHelper.h15,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todayList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return singleNotification(todayList[index]);
                  },
                ),
                SizeHelper.h20,
                 Text(
                      'Yesterday',
                      style: StyleHelper.n14
                          .copyWith(color: ColorHelper.textColor),
                    ),
                    SizeHelper.h15,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: yesterdayList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return singleNotification(yesterdayList[index]);
                  },
                ),
                SizeHelper.h10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Widget singleNotification(NotificationModel notification) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: GestureDetector(
        onTap: () {
          Get.to(const MoneyRequestScreen());
        },
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: ColorHelper.grey100),
                  color: ColorHelper.white400,
                ),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(notification.icon),
              ),
              SizeHelper.w15,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: StyleHelper.n14,
                    ),
                    SizeHelper.h5,
                    Text(
                      notification.desc,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: StyleHelper.n14.copyWith(color: ColorHelper.textColor,fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizeHelper.w15,
              const Icon(
                Icons.arrow_forward_ios,
                color: ColorHelper.textColor,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

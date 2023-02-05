
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:wallet_app/screens/notification_view/notification_screen.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';

import '../../utils/size_helper.dart';
import '../../utils/style_helper.dart';
import 'slider_widget.dart';
import 'stock_item.dart';
import 'whislist_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(userImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizeHelper.w5,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Bonna.',
                          style: StyleHelper.n14
                              .copyWith(color: ColorHelper.textColor),
                        ),
                        const Text(
                          'Welcome Back!',
                          style: StyleHelper.b18,
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(NotificationScreen());
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        notificationSVG,
                        width: 25,
                        height: 25,
                      ),
                      Positioned(
                        top: 1,
                        right: 5,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorHelper.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeHelper.h10,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: const SliderWidget(),
            ),
            SizeHelper.h20,
            rowTwoText('Whislist', size),
            SizeHelper.h10,
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: whislist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == whislist.length - 1
                            ? size.width * 0.05
                            : 0),
                    child: WhisListItem(
                      icon: whislist[index],
                      firstAmount: '3,458.50',
                      secondAmount: '4,858',
                      size: size,
                    ),
                  );
                },
              ),
            ),
            SizeHelper.h20,
            rowTwoText('Stocks', size),
            SizeHelper.h10,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stocklist.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05, vertical: 5),
                  child: StockItem(
                    icon: stocklist[index].icon,
                    name: stocklist[index].name,
                    firstAmount: '3,458.50',
                    secondAmount: '4,858',
                    date: '12 Jan 2023',
                  ),
                );
              },
            ),
            SizeHelper.h5,
          ],
        ),
      ),
    );
  }

  rowTwoText(String first, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            first,
            style: StyleHelper.b14,
          ),
          GestureDetector(
              onTap: () {},
              child: Text(
                'View All',
                style: StyleHelper.n14.copyWith(color: ColorHelper.mainColor),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/size_helper.dart';

import '../../models/request_model.dart';
import '../../utils/color_helper.dart';
import '../../utils/style_helper.dart';
import 'counter_widget.dart';
import 'request_item.dart';

class MoneyRequestScreen extends StatefulWidget {
  const MoneyRequestScreen({super.key});

  @override
  State<MoneyRequestScreen> createState() => _MoneyRequestScreenState();
}

class _MoneyRequestScreenState extends State<MoneyRequestScreen> {
  List<RequestModel> requestlist = [
    RequestModel(f1Image, 'Jennifer', 'Paypal'),
    RequestModel(f2Image, 'Walker', 'Visa'),
    RequestModel(f3Image, 'Komal', 'Paypal'),
  ];
  bool _keyboardVisible = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
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
                  'Money Request',
                  style: StyleHelper.b18,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizeHelper.h20,
                          
                          SizeHelper.h10,
                          const CounterWidget(),
                          SizeHelper.h20,
                          SizeHelper.h15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Request account',
                                style: StyleHelper.b16,
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'View All',
                                    style: StyleHelper.n14
                                        .copyWith(color: ColorHelper.mainColor),
                                  )),
                            ],
                          ),
                          SizeHelper.h10,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: requestlist.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index == requestlist.length - 1
                                    ? size.width * 0.05
                                    : 0),
                            child: RequestItem(
                              request: requestlist[index],
                              size: size,
                            ),
                          );
                        },
                      ),
                    ),
                    SizeHelper.h20,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Type of request',
                            style: StyleHelper.b16,
                          ),
                          SizeHelper.h10,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: ColorHelper.grey500),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Send Money',
                                  style: StyleHelper.n14,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizeHelper.h20,
            if(!_keyboardVisible) Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    color: ColorHelper.mainColor.withOpacity(0.8),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      height: 90,
                      width: double.infinity,
                      color: ColorHelper.mainColor,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                          height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          fingerIcon,
                          fit: BoxFit.fill,
                          width: 24,
                          height: 24,
                          color: ColorHelper.splashColor,
                        ),
                      ),
                      SizeHelper.h5,
                      Text('Press & Hold to Send request for money', 
                      textAlign: TextAlign.center,
                      style: StyleHelper.n13.copyWith(color: ColorHelper.grey500,fontSize: 11),
                      ),
                      SizeHelper.h15,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 50);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

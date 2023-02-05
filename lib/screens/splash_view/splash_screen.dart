import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/screens/sign_in_view/sign_in_screen.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../../widgets/custom_button_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorHelper.splashColor,
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
          ),
          Positioned(
            bottom: size.height * 0.1,
            right: -size.width * 0.22,
            child: rotateContainer(size),
          ),
          Positioned(
            top: size.height * 0.1,
            left: -size.width * 0.22,
            child: rotateContainer(size),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const SignInScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Skip",
                          style: StyleHelper.n14
                              .copyWith(color: ColorHelper.white),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        logoSVG,
                        width: 90,
                        height: 90,
                      ),
                      SizeHelper.h10,
                      Text(
                        "Digi-Wallet",
                        style:
                            StyleHelper.b20.copyWith(color: ColorHelper.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CarouselSlider(
                            carouselController: controller,
                            options: CarouselOptions(
                              height: 150,
                              autoPlay: false,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                            ),
                            items: List.generate(
                              3,
                              (index) => Column(
                                children: [
                                  Text(
                                    "Investing for everybody (${index+1})",
                                    style: StyleHelper.b18
                                        .copyWith(color: ColorHelper.white),
                                  ),
                                  SizeHelper.h15,
                                  Text(
                                    "We let you easily invest in fractional shares for as little as \$1",
                                    textAlign: TextAlign.center,
                                    style: StyleHelper.n14
                                        .copyWith(color: ColorHelper.white),
                                  ),
                                  SizeHelper.h20,
                                  SizeHelper.h20,
                                ],
                              ),
                            ),
                          ),
                          SizeHelper.h20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedSmoothIndicator(
                                activeIndex: _currentIndex,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                  expansionFactor: 2,
                                  activeDotColor: ColorHelper.mainColor,
                                  dotColor: Colors.grey,
                                  dotWidth: 8,
                                  dotHeight: 8,
                                ),
                              ),
                              CustomButton(
                                text: _currentIndex == 2 ? 'Get Started' : 'Next',
                                func: () {
                                  if(_currentIndex == 2){
                                    Get.to(const SignInScreen());
                                  }else{
                                    setState(() {
                                      _currentIndex++;
                                      controller.jumpToPage(_currentIndex++);
                                    });
                                    
                                  }
                                },
                                width: size.width * 0.3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  circle(Color? color) {
    return Container(
      width: color != null ? 14 : 7,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color ?? ColorHelper.white,
      ),
    );
  }

  Widget rotateContainer(Size size) {
    return Transform.rotate(
      angle: -0.45,
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorHelper.white.withOpacity(0.1),
        ),
      ),
    );
  }
}

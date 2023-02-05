
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../../utils/color_helper.dart';
import '../../utils/size_helper.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _currentIndex = 0;

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
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
                      (index) => Container(
                        height: 150,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorHelper.splashColor,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Master Card',style: StyleHelper.b16.copyWith(color: ColorHelper.white),),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(masterCartPNG,color: ColorHelper.white,))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name',style: StyleHelper.n13.copyWith(color: ColorHelper.white,fontSize: 11),),
                                SizeHelper.h5,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('0000 **** **** 9999',style: StyleHelper.n14.copyWith(color: ColorHelper.white),),
                                    Text('04/23',style: StyleHelper.n14.copyWith(color: ColorHelper.white),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizeHelper.h10,
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
                ],
              );
  }
}
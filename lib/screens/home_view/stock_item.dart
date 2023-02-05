import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

import '../../utils/color_helper.dart';

class StockItem extends StatelessWidget {
  final String icon;
  final String name;
  final String firstAmount;
  final String secondAmount;
  final String date;
  const StockItem(
      {super.key,
      required this.icon,
      required this.name,
      required this.firstAmount,
      required this.secondAmount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorHelper.grey100,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorHelper.white400,
            ),
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          SizeHelper.w10,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: StyleHelper.n14,
                    ),
                    Text(
                      '\$$firstAmount',
                      style: StyleHelper.n14,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizeHelper.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: StyleHelper.n14
                          .copyWith(color: ColorHelper.textColor),
                    ),
                    Text(
                      '+ $secondAmount%',
                      style: StyleHelper.n13,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

class WhisListItem extends StatelessWidget {
  final String icon;
  final String firstAmount;
  final String secondAmount;
  final Size size;
  const WhisListItem(
      {super.key,
      required this.icon,
      required this.firstAmount,
      required this.secondAmount, 
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width*0.05),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: ColorHelper.grey500),
        ),
        padding: const EdgeInsets.fromLTRB(5,5,20,5),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ColorHelper.grey100,
              ),
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(icon,),
            ),
            SizeHelper.w15,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$$firstAmount',style: StyleHelper.n14,),
                Text('+ $secondAmount%',style: StyleHelper.n13,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

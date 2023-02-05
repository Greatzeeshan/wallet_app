
import 'package:flutter/material.dart';
import 'package:wallet_app/models/request_model.dart';

import '../../utils/color_helper.dart';
import '../../utils/size_helper.dart';
import '../../utils/style_helper.dart';

class RequestItem extends StatelessWidget {
  final RequestModel request;
  final Size size;
  const RequestItem(
      {super.key,
      required this.request,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorHelper.grey100,
              ),
              padding: const EdgeInsets.all(1),
              child: Image.asset(request.pic,fit: BoxFit.fill,),
            ),
            SizeHelper.w5,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(request.name,style: StyleHelper.n14,),
                SizeHelper.h3,
                Text(request.cardName,style: StyleHelper.n13,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
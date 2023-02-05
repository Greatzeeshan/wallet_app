import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet_app/utils/color_helper.dart';
import 'package:wallet_app/utils/size_helper.dart';
import 'package:wallet_app/utils/style_helper.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _countController =
      TextEditingController(text: '40.0');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorHelper.grey100,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget(() {
              // ignore: unnecessary_null_comparison
              if (_countController.text != null) {
                double value = double.parse(_countController.text);
               if(value > 0){
                setState(() {
                  value--;
                  _countController.text = '$value';
                });
               }
              }
            }, Icons.remove),
            SizeHelper.w20,
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: _countController,
                autocorrect: false,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                style: StyleHelper.b18,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(5),
                ],
                decoration: const InputDecoration(
                  hintText: '0',
                  hintStyle: StyleHelper.b18,
                  icon: Text(
                    '\$',
                    style: StyleHelper.b18,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            SizeHelper.w20,
            iconWidget(() {
              // ignore: unnecessary_null_comparison
              if (_countController.text.length <= 5) {
                // ignore: unnecessary_null_comparison
                if (_countController.text != null) {
                  double value = double.parse(_countController.text);
                  setState(() {
                    value++;
                    _countController.text = '$value';
                  });
                }
              }
            }, Icons.add),
          ],
        ),
      ),
    );
  }

  iconWidget(Function func, IconData icons) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: Center(
            child: Icon(
          icons,
          size: 20,
          color: ColorHelper.white,
        )),
      ),
    );
  }
}

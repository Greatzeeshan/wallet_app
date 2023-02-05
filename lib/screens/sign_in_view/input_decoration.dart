
import 'package:flutter/material.dart';

InputDecoration inputDecoration = const InputDecoration(
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffD9D9D9)),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffD9D9D9)),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  contentPadding:  EdgeInsets.symmetric(vertical: 0, horizontal: 16),
);
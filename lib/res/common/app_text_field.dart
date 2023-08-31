import 'package:flutter/material.dart';
import 'package:gallery_app/res/common/mediaquery.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  AppTextField({Key? key, this.controller, this.labelText}) : super(key: key);
  final TextEditingController referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: height(context) / 50, horizontal: width(context) / 30),
          counter: Container(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Color(0xffE1E3E6)),
            borderRadius: BorderRadius.all(
              Radius.circular(width(context) / 30),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(width(context) / 30),
            ),
          ),
          labelText: labelText ?? "",
          filled: true,
          fillColor: Colors.white),
    );
  }
}

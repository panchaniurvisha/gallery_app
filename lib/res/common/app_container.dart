import 'package:flutter/material.dart';
import 'package:gallery_app/res/common/mediaquery.dart';

class AppContainer extends StatelessWidget {
  final Widget? widget;
  const AppContainer({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: width(context) / 10, vertical: height(context) / 20),
        height: height(context) / 20,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.amberAccent,
          //  borderRadius: BorderRadius.circular(width(context) / 1)
        ),
        child: widget!);
  }
}

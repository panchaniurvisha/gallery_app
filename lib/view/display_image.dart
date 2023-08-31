import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/model/user_model.dart';
import 'package:gallery_app/res/common/app_container.dart';
import 'package:gallery_app/res/constant/app_string.dart';

import '../res/common/mediaquery.dart';

class DisplayImage extends StatelessWidget {
  final UserModel userModel;
  const DisplayImage({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(AppString.displayTitle)),
        body: Column(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(height(context) / 10),
              child: Container(
                  height: height(context) / 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.file(File(userModel.imagePath.toString()))),
            ),
            AppContainer(
              widget: Text('Name: ${userModel.name}'),
            ),
            AppContainer(
              widget: Text('Address: ${userModel.address}'),
            ),
            AppContainer(
              widget: Text('Hobby: ${userModel.hobby}'),
            ),
            AppContainer(
              widget: Text('City: ${userModel.city}'),
            ),
          ],
        ));
  }
}

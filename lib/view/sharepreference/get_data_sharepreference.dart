import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/res/common/app_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/common/mediaquery.dart';
import '../../res/constant/app_string.dart';

class GetDataSharePreference extends StatefulWidget {
  const GetDataSharePreference({super.key});

  @override
  State<GetDataSharePreference> createState() => _GetDataSharePreferenceState();
}

class _GetDataSharePreferenceState extends State<GetDataSharePreference> {
  String? imagePath;
  String? name;
  String? address;
  String? hobby;
  String? city;

  loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      imagePath = preferences.getString('imagePath');
      name = preferences.getString("name");
      address = preferences.getString("address");
      city = preferences.getString("city");
      hobby = preferences.getString("hobby");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

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
                  child: Image.file(File(imagePath ?? ""))),
            ),
            AppContainer(
              widget: Text('Name:  ${name ?? ''}'),
            ),
            AppContainer(
              widget: Text('Address:${address ?? ''}'),
            ),
            AppContainer(
              widget: Text('Hobby:${hobby ?? ""}'),
            ),
            AppContainer(
              widget: Text('City: ${city ?? ""}'),
            ),
          ],
        ));
  }
}

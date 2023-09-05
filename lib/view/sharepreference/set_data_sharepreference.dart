import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/res/common/app_text_field.dart';
import 'package:gallery_app/res/common/mediaquery.dart';
import 'package:gallery_app/res/constant/app_string.dart';
import 'package:gallery_app/view/sharepreference/get_data_sharepreference.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetDataSharePreference extends StatefulWidget {
  const SetDataSharePreference({super.key});

  @override
  State<SetDataSharePreference> createState() => _SetDataSharePreferenceState();
}

class _SetDataSharePreferenceState extends State<SetDataSharePreference> {
  final ImagePicker picker = ImagePicker(); //instance of class
  XFile? galleryImage;
  File? pickImage;

  TextEditingController? nameController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  TextEditingController? hobbyController = TextEditingController();
  TextEditingController? cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(AppString.appTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: const Alignment(2, 1.3),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(height(context) / 10),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                      height: height(context) / 10,
                      width: height(context) / 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: pickImage != null
                          ? Image.file(
                              pickImage!,
                              fit: BoxFit.fill,
                            )
                          : const SizedBox()),
                ),
                Container(
                    height: height(context) / 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      onPressed: () async {
                        galleryImage =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (galleryImage != null) {
                          pickImage = File(galleryImage!.path);
                          setState(() {});
                        }
                      },
                    )),
              ],
            ),
            AppTextField(
              controller: nameController,
              labelText: AppString.name,
            ),
            AppTextField(
              controller: addressController,
              labelText: AppString.address,
            ),
            AppTextField(
              controller: hobbyController,
              labelText: AppString.hobby,
            ),
            AppTextField(
              controller: cityController,
              labelText: AppString.city,
            ),
            OutlinedButton(
                onPressed: () async {
                  if (pickImage != null) {
                    SharedPreferences preference =
                        await SharedPreferences.getInstance();
                    preference.setString("imagePath", pickImage!.path);
                    preference.setString("name", nameController!.text);
                    preference.setString("address", addressController!.text);
                    preference.setString("hobby", hobbyController!.text);
                    preference.setString("city", cityController!.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetDataSharePreference(),
                        ));
                  }
                },
                child: const Text(AppString.nextScreen)),
          ],
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/model/user_model.dart';
import 'package:gallery_app/res/common/app_text_field.dart';
import 'package:gallery_app/res/common/mediaquery.dart';
import 'package:gallery_app/res/constant/app_string.dart';
import 'package:gallery_app/view/display_image.dart';
import 'package:image_picker/image_picker.dart';

class PickerImageScreen extends StatefulWidget {
  const PickerImageScreen({super.key});

  @override
  State<PickerImageScreen> createState() => _PickerImageScreenState();
}

class _PickerImageScreenState extends State<PickerImageScreen> {
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
              alignment: const Alignment(0, 2),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(height(context) / 10),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                      height: height(context) / 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: pickImage != null
                          ? Image.file(pickImage!)
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
                onPressed: () {
                  if (pickImage != null) {
                    UserModel userModel = UserModel(
                      imagePath: pickImage!.path,
                      name: nameController!.text,
                      hobby: hobbyController!.text,
                      city: cityController!.text,
                      address: addressController!.text,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DisplayImage(userModel: userModel)));
                  }
                },
                child: const Text(AppString.nextScreen)),
          ],
        ));
  }
}

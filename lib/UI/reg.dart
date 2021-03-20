
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:trollyproject/model/constwidgets.dart';

class RegisterView extends StatelessWidget {
  final controller = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {




    //! Text Editing Controller
    final fnamecontroller  = TextEditingController();
    final lnamecontroller  = TextEditingController();
    final emailcontroller  = TextEditingController();
    final passwordcontroller  = TextEditingController();
    final confpasscontroller  = TextEditingController();  // Confirm Passwrd
    final citypasscontroller  = TextEditingController();  // City
    final mobilepasscontroller  = TextEditingController();  //
    final addresspasscontroller  = TextEditingController();  //

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
           ConstWidget().circleAvatar(context),
              //
              // ConstWidget().textFormField('First Name',fnamecontroller),
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('Last Name',lnamecontroller),
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('Email',emailcontroller),
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('Password',passwordcontroller),
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('Confirm Password',confpasscontroller),
              // ConstWidget().sizedBox(15),
              // //Country
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('City',citypasscontroller),
              // //Mobile No
              // ConstWidget().sizedBox(15),
              // ConstWidget().row('Mobile No', '',),
              // ConstWidget().sizedBox(5),
              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(
              //         vertical: 13.1,
              //         //bottom: 15,
              //         //top: 12.56 // space between underline and text
              //       ),
              //       decoration: BoxDecoration(
              //         //color: Colors.red,
              //           border: Border(
              //               bottom: BorderSide(
              //                 color: Colors.black, // Text colour here
              //                 width: 1.6, // Underline width
              //               ))),
              //       child: Text(
              //         "+44",
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.black, // Text colour here
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // ConstWidget().sizedBox(15),
              // ConstWidget().textFormField('Address',addresspasscontroller),
              // ConstWidget().sizedBox(15),
              // ConstWidget().rowCheckBox(
              //
              //   'By continuing, you agree to our ',
              //   'Terms & Conditions',
              //   'Privacy Policy',
              // ),
              // ConstWidget().sizedBox(15),
              // ConstWidget().button("REGISTER", Color(0xffD9281E),(){})
            ],
          ),
        ),
      ),
    );
  }

}

















class RegisterController extends GetxController {
  var ischecked = false.obs;
  var countryText = 'United Kingdom'.obs;
  var countryCodeText = '+44'.obs;
  var pickedImage=''.obs;

  checked(bool value) {
    ischecked.value = value;
    print(value);
  }

  country(value) {
    countryText.value = value;
  }

  loadPicker(ImageSource source, context) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      // print(picked);
      _cropImage(picked);
    }
    Get.back();

  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      //pickedImage.value = cropped;
      pickedImage.value = cropped.path;
      print(pickedImage);
      print('Cropping Done');
      update();
    }
    else{
      print('Not Cropping');
    }
  }
}



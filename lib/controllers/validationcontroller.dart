import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  var ischecked = false.obs;
  var countryText = 'United Kingdom'.obs;
  var countryCodeText = '+44'.obs;
  var pickedImage;
  //! Text Editing Controller
  final fnamecontroller  = TextEditingController();
  final lnamecontroller  = TextEditingController();
  final emailcontroller  = TextEditingController();
  final passwordcontroller  = TextEditingController();
  final confpasscontroller  = TextEditingController();  // Confirm Passwrd
  final citypasscontroller  = TextEditingController();  // City
  final mobilepasscontroller  = TextEditingController();  //
  final addresspasscontroller  = TextEditingController();  //


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
      pickedImage = File(cropped.path);
      print(pickedImage);
      print('Cropping Done');
      update();
    }
    else{
      print('Not Cropping');
    }
  }

  void errorSnackbar({@required String msg}) {
    return Get.snackbar(
        '$msg',
        "Error !",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[200],
        colorText: Colors.white
    );
  }

  void doLogin() {
    if (emailcontroller.text.isEmpty) {
      errorSnackbar(msg: 'Enter Email Address');

    }else if(!emailcontroller.text.contains('@')){
      errorSnackbar(msg: 'Email is not valud');
    }

    else if (passwordcontroller.text.isEmpty) {
      errorSnackbar(msg: 'Enter Password');
    } else if (passwordcontroller.text.length < 6) {
      errorSnackbar(msg: "Password must be 6 digit");
    }
    else if (confpasscontroller.text==passwordcontroller.text) {
      errorSnackbar(msg: "Password does not match");
    }
    else if (fnamecontroller.text.isEmpty) {
      errorSnackbar(msg: 'Kindly Enter First Name');
      // requestLogin();
    }
    else if (lnamecontroller.text.isEmpty) {
      errorSnackbar(msg: 'Kindly Enter Last Name');
      // requestLogin();
    }
    else if (citypasscontroller.text.isEmpty) {
      errorSnackbar(msg: 'Kindly select city');
      // requestLogin();
    }
    else if (addresspasscontroller.text.isEmpty) {
      errorSnackbar(msg: 'Address is Missing');
      // requestLogin();
    }
    else if (mobilepasscontroller.text.isEmpty) {
      errorSnackbar(msg: 'Mobile Number is Missing');
      // requestLogin();
    }


  }

}
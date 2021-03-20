import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trollyproject/controllers/Network/network.dart';
import 'package:trollyproject/model/LoginModel.dart';
import 'package:trollyproject/model/forgot.dart';
import 'dart:io';





class RegisterControllers extends GetxController{

  RxBool name = false.obs;

  var pickedImage ;

  RxBool lname = false.obs;

  RxBool emailvalidation = false.obs;
  RxBool emailvalidation1 = false.obs;
  RxBool emailtextfieldicon = false.obs;
  RxBool showemailarrow = false.obs;
  RxBool showemailarrow1 = false.obs;


  RxBool passwordvalidation = false.obs;
  RxBool passwordvalidation1 = false.obs;
  RxBool passtextfieldicon = false.obs;
  RxBool showpasswordarrow = false.obs;
  RxBool showepasswordarrow1 = false.obs;



  RxBool cnfpassvalidation = false.obs;
  RxBool cnfpassvalidation1 = false.obs;
  RxBool cnfpasstextfieldicon = false.obs;
  RxBool showcnfpassarrow = false.obs;
  RxBool showcnfpassarrow1 = false.obs;



  RxBool phonevalidation = false.obs;
  RxBool phonevalidation1 = false.obs;
  RxBool phonetextfieldicon = false.obs;
  RxBool showephonearrow = false.obs;
  RxBool showephonearrow1 = false.obs;






  RxBool circular = false.obs;





  var countrycode =''.obs;





  RxBool showredicon1=false.obs;
  RxBool showicon = false.obs;

  RxBool city = false.obs;
  RxBool number = false.obs;
  RxBool number1 = false.obs;
  RxBool address = false.obs;

var check = ''.obs;
  TextEditingController fName;
  TextEditingController countryCode;

  TextEditingController lName;
  TextEditingController loginemail;
  TextEditingController loginpass;
TextEditingController resetPass;

  TextEditingController emailtxt;
  TextEditingController passtxt;
  TextEditingController cnftxt;
  TextEditingController phonetxt;
  TextEditingController addtxt;
  TextEditingController countrytxt;
  TextEditingController citytxt;


  Rx<Loginmodel> loginmodel =Loginmodel().obs;
Rx<Forgot> forgot =Forgot().obs;



  getdata(String name,String lastname,String email,String address,String city,String password,String phoneNumber,String countryCode) async{
    var Register = await Network().registeration(name,lastname,email,address,city,password,phoneNumber,countryCode);


  }


  FocusNode firstNameFocus;

FocusNode lastNameFocus;

FocusNode emailNameFocus;
FocusNode passNameFocus;
FocusNode cnfNameFocus;

FocusNode countryNameFocus;

FocusNode cityNameFocus;

FocusNode phoneNameFocus;
FocusNode addNameFocus;
FocusNode submit;
FocusNode loginnode;
RxBool checkbox = false.obs;
TextEditingController loginemailtxt;
var countrycodename = ''.obs;





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    resetPass =TextEditingController();
    loginemailtxt =TextEditingController();

    loginemail= TextEditingController();
    loginpass= TextEditingController();
    fName =TextEditingController();
    lName =TextEditingController();
    emailtxt =TextEditingController();
    passtxt =TextEditingController();
    cnftxt =TextEditingController();
    phonetxt =TextEditingController();
    addtxt =TextEditingController();
    countrytxt =TextEditingController();
    citytxt =TextEditingController();
    countryCode =TextEditingController(text: 'country');
    countryCode.text=countrycode.value;


     firstNameFocus=FocusNode();
    loginnode=FocusNode();

    lastNameFocus=FocusNode();
    submit = FocusNode();


    emailNameFocus=FocusNode();
     passNameFocus=FocusNode();
     cnfNameFocus=FocusNode();

     countryNameFocus=FocusNode();

     cityNameFocus=FocusNode();

     phoneNameFocus=FocusNode();
     addNameFocus=FocusNode();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    resetPass.dispose();
    fName.dispose();
    lName.dispose();
    emailtxt.dispose();
    passtxt.dispose();
    submit.dispose();
    loginemailtxt.dispose();

    cnftxt.dispose();
    phonetxt.dispose();
    addtxt.dispose();
    countrytxt.dispose();
    citytxt.dispose();
    countryCode.dispose();
    loginemail.dispose();
    loginpass.dispose();
    loginnode.dispose();

    firstNameFocus.dispose();
    lastNameFocus.dispose();

    emailNameFocus.dispose();
    passNameFocus.dispose();
    cnfNameFocus.dispose();

    countryNameFocus.dispose();

    cityNameFocus.dispose();

    phoneNameFocus.dispose();
    addNameFocus.dispose();
    super.dispose();




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


}




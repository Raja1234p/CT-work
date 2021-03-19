import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/Network/network.dart';
import 'package:trollyproject/model/LoginModel.dart';
import 'package:trollyproject/model/forgot.dart';
import 'package:trollyproject/model/loginandsignup.dart';
import 'dart:io';

// class CustomValidator extends GetxController{
//
//   RxBool showTooltip = false.obs;
//   RxBool email = false.obs;
//
//   RxBool password = false.obs;
//   RxBool password1 = false.obs;
//
//   RxBool name = false.obs;
//   RxBool name1 = false.obs;
//
//   RxBool cnfpass = false.obs;
//   RxBool cnfpass1 = false.obs;
//
//   RxBool lname = false.obs;
//   RxBool lname1 = false.obs;
//
//   RxBool country = false.obs;
//   RxBool city = false.obs;
//
//   RxBool number = false.obs;
//   RxBool number1 = false.obs;
//
//   RxBool address = false.obs;
//   RxBool address1 = false.obs;
//
//
//   Rx<Welcome> welcome =Welcome().obs;
//
//   getdata(String name,String lastname,String email,String address,String city,String password,String phoneNumber) async{
//     welcome= await Network().registeration(name,lastname,email,address,city,password,phoneNumber);
//   }
//
// @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//
//
//   }
//
//
//
//
//
// }



class CustomValidator extends GetxController{

  RxBool name = false.obs;


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


getlogindata(String email,String Pass) async{

    loginmodel = await Network().login(email, Pass);
  }
passReset(String pass) async{
  forgot = await Network().forgotPassword(pass);
}
  getdata(String name,String lastname,String email,String address,String city,String password,String phoneNumber,String countryCode) async{
    var register = await Network().registeration(name,lastname,email,address,city,password,phoneNumber,countryCode);


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
// String emailAndPhone;
  // String password;
  //
  // String cnfPass;
  // String phone;
  // String address;
  // String country;
  // String city;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Network().forgotPassword("Azeemkalwar51@gmail.com");
    // Network().checkmodel();
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





}




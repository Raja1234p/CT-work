import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trollyproject/model/loginandsignup.dart';

import 'Network/network.dart';

class ProfileController extends GetxController{
FocusNode focusNode;
FocusNode newpass;
FocusNode cnfnewpass;

FocusNode firstNameFocus;
FocusNode lastNameFocus;
FocusNode emailNameFocus;
FocusNode phoneNameFocus;
FocusNode addNameFocus;





  TextEditingController fName;
  TextEditingController newPassword;
  TextEditingController cnftxt;
  TextEditingController lName;
  TextEditingController emailtxt;
  TextEditingController countryCode;
  TextEditingController phonetxt;
  TextEditingController addtxt;
  TextEditingController passtxt;

  RxBool enableAndDiableTextField = false.obs;
  RxBool enableAndDiablepassfield= false.obs;


  GetRegisterData getRegisterData = GetRegisterData();

setPassToggle(){

  enableAndDiablepassfield.value=enableAndDiablepassfield.value==true?false:true;
}

  setToggle(){
print('done');
    enableAndDiableTextField.value = enableAndDiableTextField.value == true ? false : true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passtxt=TextEditingController();
    fName=TextEditingController(text: '');
    lName=TextEditingController(text: '');
    emailtxt=TextEditingController(text: '');
    countryCode=TextEditingController(text: '');
    phonetxt=TextEditingController(text: '');
    addtxt=TextEditingController(text: '');
    newPassword=TextEditingController();
    cnftxt=TextEditingController();


    addtxt=TextEditingController(text: '');


  }

  postUpdate(
      String fName,String lName,String newPassword,String phoneNumber,String email,String oldPassword,String tokenid,String userid) async{
  print("begin");
  print('**********************************************************************');
  print("this is old before new ${newPassword}password ");
  var post=await Network().updateProfile(fName, lName, newPassword, phoneNumber, email,oldPassword,tokenid,userid);
  print('**********************************************************************');

  print('**********************************************************************');
  print("this is new  after password ${newPassword}password ");

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passtxt.dispose();
    fName.dispose();
    lName.dispose();
    emailtxt.dispose();
    countryCode.dispose();
    phonetxt.dispose();
    addtxt.dispose();
    newPassword.dispose();
    cnftxt.dispose();

  }






}
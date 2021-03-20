import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Network/network.dart';

class LoginController extends GetxController{


  TextEditingController emailtxt;
  TextEditingController passtxt;
  FocusNode emailNameFocus;
  FocusNode passNameFocus;
  FocusNode submit;
  TextEditingController resetPass;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailNameFocus = FocusNode();
    passNameFocus = FocusNode();
    submit = FocusNode();


    resetPass=TextEditingController();

    emailtxt=TextEditingController();
    passtxt=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailtxt.dispose();
    passtxt.dispose();
  }


  getlogindata(String email,String Pass) async{

    var loginmodel = await Network().login(email, Pass);
  }
  passReset(String pass) async{
   var forgot = await Network().forgotPassword(pass);
  }


}
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trollyproject/UI/Profile.dart';
import 'package:trollyproject/UI/login.dart';
import 'package:trollyproject/UI/validationui.dart';
import 'package:trollyproject/model/forgot.dart';
import 'package:trollyproject/model/loginandsignup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trollyproject/model/UpdatedProfile.dart';

import '../../apivalidation.dart';
import '../ProfileController.dart';
import '../customvalidatorcontroller.dart';

class Network {
  CustomValidator controller = Get.put(CustomValidator());
  ProfileController profileController = Get.put(ProfileController());

  List<User>userdata=[];
  List<Users>_list=[];

  var baseUrl = "http://192.168.1.197:8000/api/user/";
  var checkemail = 'phone number exist';








  Future registeration(
      String name,
      String lastname,
      String email,
      String address,
      String city,
      String password,
      String phoneNumber,
      String countryCode) async {



    Dio dio = new Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;
    var data = {
      "phone": phoneNumber,
      "password": password,
      "cart_unique_token": "11e0f31e-c5cc-5dad-762b-0e3219c631ec",
      "country_id": "5f733d3625966065868918af",
      "city": city,
      "social_id": "",
      "login_by": "manual",
      "country_phone_code": countryCode,
      "first_name": name,
      "last_name": lastname,
      "email": email,
      "address": address,
      "referral_code": "",
      "is_phone_number_verified": false,
      "is_email_verified": false
    };
    // "https://app.trolleymate.co.uk/api/user/register"

    var response = await dio.post(
      baseUrl + "register",
      data: data,
    );


    if (response.statusCode == 200) {
      controller.circular.value=true;



      var jsonData = response.data;
      if (jsonData['error_code'] == 503) {
        controller.circular.value=false;


        Fluttertoast.showToast(msg: 'phone number already exist');

        print(response.data);
      } else if (jsonData['error_code'] == 502) {
        controller.circular.value=false;
        Fluttertoast.showToast(msg: 'Email Already Registered');
      } else {
        Fluttertoast.showToast(msg: 'Registered Successfully');
        controller.circular.value=true;

        Get.to(()=>Login());

        controller.fName.clear();
        controller.lName.clear();
        controller.emailtxt.clear();
        controller.addtxt.clear();
        controller.citytxt.clear();
        controller.passtxt.clear();
        controller.phonetxt.clear();
        controller.countryCode.clear();
        controller.cnftxt.clear();
        controller.countrytxt.clear();


      }
      print(response.data);
    } else {
      print('Error');
      Get.back();
    }
  }

  Future login(String email, String password) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;

    var data = {
      "email": email,
      "password": password,
    };
    var response = await dio.post(baseUrl + "login", data: data);
    if (response.statusCode == 200) {
      var jsonData = response.data;
      if (jsonData['error_code'] == 512) {
        print('Email does not exist');
        LoginPage();

        Fluttertoast.showToast(msg: 'Email does not exist');

        print(response.data);
      } else if (jsonData['error_code'] == 513) {
        Fluttertoast.showToast(msg: 'Invalidpassword');
      } else {
        controller.fName.clear();
        controller.lName.clear();
        controller.emailtxt.clear();
        controller.addtxt.clear();
        controller.citytxt.clear();
        controller.passtxt.clear();
        controller.phonetxt.clear();
        controller.countryCode.clear();
        controller.cnftxt.clear();
        controller.countrytxt.clear();
        Fluttertoast.showToast(msg: 'Login Successfully');
        try{
          var userModel = GetRegisterData.fromJson(jsonData);
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          User user = userModel.user;
          userdata.add(user);
          for(int i =0;i<=userdata.length-1;i++){
            profileController.fName.text=userdata[i].firstName;
            profileController.lName.text=userdata[i].lastName;
            profileController.emailtxt.text=userdata[i].email;
            profileController.countryCode.text=userdata[i].countryPhoneCode;
            profileController.phonetxt.text=userdata[i].phone;
            profileController.addtxt.text=userdata[i].address;
            sharedPreferences.setString('token_id', userdata[i].serverToken);
            sharedPreferences.setString('user_id', userdata[i].id);
            print(" this is token id ${sharedPreferences.get("token_id")}");
            print("this is user id ${sharedPreferences.get("user_id")}");







            print(" this is the name of user  ${userdata[i].firstName.toString()}");
            Get.to(Profile());



          }


        }catch(e){
        print('what is the error');
        }





      }

      print(' Done with login ${response.data}');
    } else {
      print('Error');
      Get.back();
    }
  }

  Future forgotPassword(String email) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;
    // var jsonVar = json.encode(Forgot().toJson());

    var data = {"email": email, "type": 7};

    var response = await dio.post(
        "http://192.168.1.197:8000/api/admin/forgot_password",
        data: data);
    if (response.statusCode == 200) {
      var jsonData = response.data;
      print(jsonData);
      if (jsonData['error_code'] == 1000) {
        Fluttertoast.showToast(msg: 'This email does not exist');
      } else {
        controller.fName.clear();
        controller.lName.clear();
        controller.emailtxt.clear();
        controller.addtxt.clear();
        controller.citytxt.clear();
        controller.passtxt.clear();
        controller.phonetxt.clear();
        controller.countryCode.clear();
        controller.cnftxt.clear();
        controller.countrytxt.clear();



        Fluttertoast.showToast(msg: 'Check Your Email');

        Get.to(() => LoginPage());
      }
    } else {
      print(response.data);
    }
  }

  Future updateProfile(String fName,String lName,String newPassword,String phoneNumber,String email,String oldPassword,String tokenid,String userid) async{

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;
    var data ={


    "user_id": userid,
    "server_token": tokenid,
    "phone":phoneNumber,
    "email": email,
    "new_password": newPassword,
    "first_name": fName,
    "last_name": lName,
    "social_id":"",
    "login_by": "manual",
    "old_password": oldPassword

    };

    //print("2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222");
    print("this is new password updated ok${newPassword}");
     var response = await dio.post(baseUrl+"update",data: data);
     if(response.statusCode==200){
       print(response.data);
       var jsonData = response.data;
       if(jsonData['error_code']==513){
         Fluttertoast.showToast(msg: 'Invalid password');
         print('error');
       }
       else{
         try{
         var userModels = UpdatedProfile.fromJson(jsonData);
         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
         Users users = userModels.user;
         _list.add(users);

         for(int i =0;i<=_list.length-1;i++){
           profileController.fName.text=_list[i].firstName;
           profileController.lName.text=_list[i].lastName;
           profileController.emailtxt.text=_list[i].email;
           profileController.countryCode.text=_list[i].countryPhoneCode;
           profileController.phonetxt.text=_list[i].phone;
           profileController.addtxt.text=_list[i].address;

                print(" this is updated password it is called old password ok${_list[i].password}");

         }
                print( profileController.fName.text.toString());
         profileController.passtxt.clear();
         Fluttertoast.showToast(msg: 'Profile Updated Successfully');

         print(response.data);}catch(e){
           Fluttertoast.showToast(msg: 'Not Updated');



         }

       }

     }
     else{
       Fluttertoast.showToast(msg: 'error');

     }


  }
}

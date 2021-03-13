import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trollyproject/UI/login.dart';
import 'package:trollyproject/UI/validationui.dart';
import 'package:trollyproject/model/loginandsignup.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../apivalidation.dart';

class Network{

  var baseUrl="https://app.trolleymate.co.uk/api/user/";
  var checkemail ='phone number exist';

  Future registeration(String name,String lastname,String email,String address,String city,String password,String phoneNumber,String countryCode)async{
    Dio dio = new Dio();


    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;
    var data= {
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
      "email":email,
      "address":address,
      "referral_code": "",
      "is_phone_number_verified": false,
      "is_email_verified": false
    };
    // "https://app.trolleymate.co.uk/api/user/register"

    var response = await dio.post(baseUrl+"register",
    data: data,
    );
    if(response.statusCode==200){
      var jsonData = response.data;
      if(jsonData['error_code']==503){


        print('finally it is running');
LoginPage().print('Phone Error');

Fluttertoast.showToast(msg: 'phone number already exist');

        print(response.data);




      }
      else if(jsonData['error_code']==502){
        Fluttertoast.showToast(msg: 'Email Already Registered');
      }

      else{
        Fluttertoast.showToast(msg: 'Registered Successfully');

        Get.to(()=>Login());
      }
      print(response.data);





    }
    else{
      print('Error');
      Get.back();
    }

  }

  Future login(String email,String password) async{
    Dio dio =Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;

    var data={
      "email": email,
      "password": password,
    };
    var response = await dio.post(baseUrl+"login",
    data: data
    );
    if(response.statusCode==200){

      var jsonData = response.data;
      if(jsonData['error_code']==512){


        print('Email does not exist');
        LoginPage().print('Phone Error');

        Fluttertoast.showToast(msg: 'Email does not exist');

        print(response.data);




      }
      else if(jsonData['error_code']==513){
        Fluttertoast.showToast(msg: 'Password is Invalid');
      }
      else{
        Fluttertoast.showToast(msg: 'Login Successfully');

      }

      print(' Done with login ${response.data}');
    }
    else{
      print('Error');
      Get.back();
    }


  }


}
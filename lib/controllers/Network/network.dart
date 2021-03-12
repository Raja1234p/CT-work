import 'package:dio/dio.dart';
import 'package:trollyproject/model/loginandsignup.dart';

class Network{

  var baseUrl="https://app.trolleymate.co.uk/api/user/";

  Future registeration(String name,String lastname,String email,String address,String city,String password,String phoneNumber)async{
    Dio dio = new Dio();


    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['lang'] = 0;
    var data= {
      "phone": phoneNumber,
      "password": password,
      "cart_unique_token": "11e0f31e-c5cc-5dad-762b-0e3219c631ec",
      "country_id": "5f733d3625966065868918af",
      "city": city,
      "social_id": "80",
      "login_by": "manual",
      "country_phone_code": "+88",
      "first_name": name,
      "last_name": lastname,
      "email":email,
      "address":address,
      "referral_code": "",
      "is_phone_number_verified": false,
      "is_email_verified": false
    };


    Response response = await dio.post("https://app.trolleymate.co.uk/api/user/register",
    data: data,
    );
    if(response.statusCode==200){
      print(response.data);
      // Welcome welcome = Welcome.fromJson(response.data);
// print(' It is the response ${response}');      // User user = welcome.user;
      // print(user);

    }

    else{
      print('Error');
    }

  }


}
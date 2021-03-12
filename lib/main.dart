import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:intl/intl.dart';

import 'UI/cartui.dart';
import 'UI/customvalidation.dart';
import 'UI/stripeui.dart';
import 'UI/validationui.dart';
import 'controllers/customvalidatorcontroller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(home:LoginPage()));
}

// class CustomDate extends StatefulWidget {
//
//
//
//   @override
//   _CustomDateState createState() => _CustomDateState();
// }
//
// class _CustomDateState extends State<CustomDate> {
//
//
//   customsDate(){
//     String uTCTime="2021-03-06T10:32:18.949Z";
//     DateTime date = DateTime.now();
//     var dateFormat = DateFormat().add_EEEE(); // you can change the format here
//     var utcDate = dateFormat.format(DateTime.parse(uTCTime)); // pass the UTC time here
//     var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
//     String createdDate = dateFormat.format(DateTime.parse(localDate));
//     print(createdDate);// you will local time
//   }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     customsDate();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//     );
//   }
// }

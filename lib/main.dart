import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:trollyproject/UI/reg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:intl/intl.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'UI/cartui.dart';
import 'UI/customvalidation.dart';
import 'UI/login.dart';
import 'UI/stripeui.dart';
import 'UI/RegisterScreen.dart';
import 'apivalidation.dart';
import 'controllers/RegisterController.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:trollyproject/UI/Profile.dart';

import 'controllers/stripecontroller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(home:RegisterView()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StripeController controller = Get.put(StripeController());
String name='';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: new Scaffold(

        body:


              Center(child: country()),



      ),
    );
  }

  CountryCodePicker country() {
    return CountryCodePicker(


                textOverflow: TextOverflow.visible,
                  dialogSize: Size(350, 150),
                  hideSearch: true,

                  initialSelection: 'TF',
                  showCountryOnly: false,
                 showFlag: false,
                  showOnlyCountryWhenClosed: true,
                closeIcon: Icon(Icons.done),
                onChanged:(e){


                    controller.countryname.value = e.dialCode;

                },
                onInit: (code) {
                  // print(code.dialCode);

                    name = code.dialCode;

                controller.countryname.value=code.dialCode;
                // print(controller.countryname.value);

                },


                  favorite: ['+39', 'FR'],


            );
  }
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

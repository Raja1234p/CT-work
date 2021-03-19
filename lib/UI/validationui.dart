// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:country_code_picker/country_localizations.dart';
// import 'package:trollyproject/UI/login.dart';
// import 'package:trollyproject/apivalidation.dart';
// import 'package:trollyproject/controllers/customvalidatorcontroller.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:trollyproject/controllers/stripecontroller.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// class LoginPage extends StatelessWidget {
//   CustomValidator controller = Get.put(CustomValidator());
//
//   GlobalKey<FormState> _formKey = GlobalKey();
//
//   Pattern pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//
//   launchURL() async {
//     const url = 'https://app.trolleymate.co.uk/terms.html';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   StripeController controllers = Get.put(StripeController());
//
//   @override
//   Widget build(BuildContext context) {
//     Orientation orientation = MediaQuery.of(context).orientation;
//     return MaterialApp(
//       supportedLocales: [
//         Locale("af"),
//         Locale("am"),
//         Locale("ar"),
//         Locale("az"),
//         Locale("be"),
//         Locale("bg"),
//         Locale("bn"),
//         Locale("bs"),
//         Locale("ca"),
//         Locale("cs"),
//         Locale("da"),
//         Locale("de"),
//         Locale("el"),
//         Locale("en"),
//         Locale("es"),
//         Locale("et"),
//         Locale("fa"),
//         Locale("fi"),
//         Locale("fr"),
//         Locale("gl"),
//         Locale("ha"),
//         Locale("he"),
//         Locale("hi"),
//         Locale("hr"),
//         Locale("hu"),
//         Locale("hy"),
//         Locale("id"),
//         Locale("is"),
//         Locale("it"),
//         Locale("ja"),
//         Locale("ka"),
//         Locale("kk"),
//         Locale("km"),
//         Locale("ko"),
//         Locale("ku"),
//         Locale("ky"),
//         Locale("lt"),
//         Locale("lv"),
//         Locale("mk"),
//         Locale("ml"),
//         Locale("mn"),
//         Locale("ms"),
//         Locale("nb"),
//         Locale("nl"),
//         Locale("nn"),
//         Locale("no"),
//         Locale("pl"),
//         Locale("ps"),
//         Locale("pt"),
//         Locale("ro"),
//         Locale("ru"),
//         Locale("sd"),
//         Locale("sk"),
//         Locale("sl"),
//         Locale("so"),
//         Locale("sq"),
//         Locale("sr"),
//         Locale("sv"),
//         Locale("ta"),
//         Locale("tg"),
//         Locale("th"),
//         Locale("tk"),
//         Locale("tr"),
//         Locale("tt"),
//         Locale("uk"),
//         Locale("ug"),
//         Locale("ur"),
//         Locale("uz"),
//         Locale("vi"),
//         Locale("zh")
//       ],
//       localizationsDelegates: [
//         CountryLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       home: Scaffold(
//         body: SafeArea(
//           child: Container(
//               width: double.infinity,
//               child: Form(
//                 key: _formKey,
//                 child: ListView(
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                     ),
//                     GetX<CustomValidator>(
//                         initState: (_) {},
//                         builder: (controller) {
//                           return Column(
//                             children: [
//                             Text(" hello am raja${controller.countrycodename.value}"),
//                               NameTextField(
//                                   controller.fName,
//                                   'Please enter a valid name.',
//                                   "First Name ",
//                                   TextInputType.name,
//                                   controller.name.value,
//                                   controller.firstNameFocus, (term) {
//                                 controller.firstNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.lastNameFocus);
//                               }, TextInputAction.next),
//                               NameTextField(
//                                   controller.lName,
//                                   'Please enter a valid name.',
//                                   "Last Name ",
//                                   TextInputType.name,
//                                   controller.lname.value,
//                                   controller.lastNameFocus, (term) {
//                                 controller.lastNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.emailNameFocus);
//                               }, TextInputAction.next),
//                               emailandpass(
//                                   controller.emailtxt,
//                                   controller.showTooltip.value,
//                                   controller.email.value,
//                                   controller.confirmemail.value,
//                                   'Email or Phone',
//                                   "Please enter a valid emailn or phone number.",
//                                   "Please enter a valid emailn or phone number.",
//                                   TextInputType.emailAddress,
//                                   false,
//                                   null,
//                                   controller.emailNameFocus, (term) {
//                                 controller.emailNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.passNameFocus);
//                               }, true, TextInputAction.next),
//                               emailandpass(
//                                   controller.passtxt,
//                                   controller.password.value,
//                                   controller.password1.value,
//                                   controller.passwordss.value,
//                                   'Password',
//                                   "Please enter a password.",
//                                   "Password must be 6 character and above",
//                                   null,
//                                   true,
//                                   null,
//                                   controller.passNameFocus, (term) {
//                                 controller.passNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.cnfNameFocus);
//                               }, true, TextInputAction.next),
//                               emailandpass(
//                                   controller.cnftxt,
//                                   controller.cnfpass.value,
//                                   controller.cnfpass1.value,
//                                   controller.confirmpass.value,
//                                   'Confirm Password',
//                                   " Confirm Password does not match.",
//                                   " Confirm Password does not match.",
//                                   null,
//                                   true,
//                                   null,
//                                   controller.cnfNameFocus, (term) {
//                                 controller.cnfNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.countryNameFocus);
//                               }, true, TextInputAction.next),
//                               // GestureDetector(
//                               //   child: NameTextField(
//                               //       controller.countrytxt,
//                               //       "Kindly Select Country.",
//                               //       'Country',
//                               //       TextInputType.name,
//                               //       controller.country.value,
//                               //       controller.countryNameFocus, (term) {
//                               //     controller.countryNameFocus.unfocus();
//                               //     FocusScope.of(context)
//                               //         .requestFocus(controller.cityNameFocus);
//                               //   }, TextInputAction.next),
//                               //   onTap: (){
//                               //     phoneNumberDialog(context);
//                               //     print('raja');
//                               //   },
//                               // ),
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 12.0,
//                                   right: 17,
//                                 ),
//                                 child: Container(
//                                   // color: Colors.red,
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                               width: 2, color: Colors.black))),
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 4.0),
//                                         child: Text(
//                                           'Select Country',
//                                           style:
//                                               TextStyle(color: Colors.black45),
//                                         ),
//                                       ),
//                                       country(),
//                                     ],
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                   ),
//                                 ),
//                               ),
//
//                               NameTextField(
//                                   controller.citytxt,
//                                   'Please select valid city.',
//                                   'City',
//                                   TextInputType.text,
//                                   controller.city.value,
//                                   controller.cityNameFocus, (term) {
//                                 controller.countryNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.addNameFocus);
//                               }, TextInputAction.next),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: countrycode(
//                                         controller.countryCode,
//                                         '+92',
//                                         TextInputType.phone,
//                                         FloatingLabelBehavior.always),
//                                     flex: 1,
//                                   ),
//                                   Expanded(
//                                     child: emailandpass(
//                                         controller.phonetxt,
//                                         controller.number.value,
//                                         controller.number1.value,
//                                         controller.confirmnumber.value,
//                                         'Number',
//                                         "Please enter a mobiel number length.",
//                                         'Please enter a mobiel number length 11or11 digits.',
//                                         TextInputType.phone,
//                                         false,
//                                         [
//                                           LengthLimitingTextInputFormatter(16),
//                                         ],
//                                         controller.phoneNameFocus, (term) {
//                                       controller.phoneNameFocus.unfocus();
//                                       FocusScope.of(context).requestFocus(
//                                           controller.addNameFocus);
//                                     }, true, TextInputAction.next),
//                                     flex: 3,
//                                   ),
//                                 ],
//                               ),
//                               NameTextField(
//                                   controller.addtxt,
//                                   "Kindly Enter Address",
//                                   'Address',
//                                   TextInputType.text,
//                                   controller.address.value,
//                                   controller.addNameFocus, (term) {
//                                 controller.addNameFocus.unfocus();
//                                 FocusScope.of(context)
//                                     .requestFocus(controller.submit);
//                               }, TextInputAction.done),
//                               Row(children: [
//                                 Expanded(
//                                   child: CheckboxListTile(
//                                       title: GestureDetector(
//                                         child: Text.rich(
//                                           TextSpan(
//                                             text:
//                                                 'By continuing, you agree to our ',
//                                             style: TextStyle(
//                                                 fontSize: 11, letterSpacing: 1),
//                                             children: <TextSpan>[
//                                               TextSpan(
//                                                   text: 'Terms & Condition',
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     decoration: TextDecoration
//                                                         .underline,
//                                                   )),
//                                               TextSpan(
//                                                   text: ' and ',
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                   )),
//                                               TextSpan(
//                                                   text: 'Privacy Policy',
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     decoration: TextDecoration
//                                                         .underline,
//                                                   )),
//
//                                               // can add more TextSpans here...
//                                             ],
//                                           ),
//                                           maxLines: 2,
//                                         ),
//                                         onTap: () {
//                                           launchURL();
//                                         },
//                                       ),
//                                       controlAffinity:
//                                           ListTileControlAffinity.leading,
//                                       activeColor: Colors.red,
//                                       value: controller.checkbox.value,
//                                       onChanged: (e) {
//                                         controller.checkbox.value = e;
//                                       }),
//                                 ),
//                               ]),
//
//                             ],
//                           );
//                         }),
//
//                     TextButton(
//                       child: Text('hello '),onPressed: () async{
//                       await  print( controller.country.value?controller.countrycodename.value:'raja');
//                     },
//                     ),
//                   ],
//                 ),
//               )),
//         ),
//         bottomNavigationBar: Padding(
//           padding:
//               const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
//           child: Container(
//             width: Get.width,
//             height: orientation == Orientation.portrait
//                 ? Get.height * 0.06
//                 : Get.height * 0.123,
//             child: ElevatedButton(
//               focusNode: controller.submit,
//               onPressed: () {
//                 check('gggg');
//               },
//               child: Text('Register'.toUpperCase()),
//               style: ElevatedButton.styleFrom(primary: Colors.red),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   CountryCodePicker country() {
//     return CountryCodePicker(
//       padding: EdgeInsets.all(0),
//       alignLeft: true,
//       textOverflow: TextOverflow.visible,
//       dialogSize: Size(350, 200),
//       hideSearch: false,
//
//       initialSelection: 'uk',
//       showCountryOnly: false,
//       showFlag: false,
//       showOnlyCountryWhenClosed: true,
//
//       closeIcon: Icon(Icons.close),
//
//       onChanged: (e)  {
//           controller.countryname.value=e.name;
//           controller.countrycodename.value=e.dialCode;
//         // controller.countrycode.value = e.dialCode;
//       },
//       // onInit: (code) {
//       //   print(code.dialCode);
//       //
//       //
//       //
//       //
//       //   //print(controller.countryname.value);
//       //
//       // },
//
//       favorite: ['+39', 'FR'],
//     );
//   }
//
//   bool _validateUserData() {
//     final RegExp _phoneRegex = new RegExp(r"^\+{1}\d{10,17}");
//
//     RegExp regex = new RegExp(pattern);
//
//     if (controller.fName.text.trim().isEmpty) {
//       print('first name is missing');
//       controller.name.value = true;
//       return false;
//     } else if (controller.lName.text.trim().isEmpty) {
//       print('Last name is missing');
//       controller.name.value = false;
//       controller.lname.value = true;
//       return false;
//     } else if (controller.emailtxt.text.trim().isEmpty) {
//       print('email  is missing');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = true;
//       controller.confirmemail.value = true;
//
//       return false;
//     } else if (!regex.hasMatch(controller.emailtxt.text.trim()) ||
//         _phoneRegex.hasMatch(controller.emailtxt.text.trim())) {
//       print('email  not valid');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.confirmemail.value = true;
//       controller.email.value = true;
//       controller.password.value = false;
//
//       controller.passwordss.value = false;
//       controller.password1.value = false;
//
//       return false;
//     } else if (controller.passtxt.text.trim().isEmpty) {
//       print('password is empty');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.confirmemail.value = false;
//       controller.passwordss.value = true;
//       controller.password.value = true;
//
//       return false;
//     } else if (controller.passtxt.text.trim().length < 6) {
//       print('password is less than 6');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.confirmemail.value = false;
//
//       controller.passwordss.value = true;
//       controller.password1.value = true;
//
//       return false;
//     } else if (controller.cnftxt.text.trim().isEmpty) {
//       print('confirm password is empty');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.confirmemail.value = false;
//
//       controller.passwordss.value = false;
//       controller.password1.value = false;
//       controller.cnfpass.value = true;
//
//       controller.confirmpass.value = true;
//
//       return false;
//     } else if (controller.cnftxt.text.trim() !=
//         controller.passtxt.text.trim()) {
//       print('password does not match');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.confirmpass.value = true;
//       controller.cnfpass.value = false;
//       controller.confirmemail.value = false;
//
//       controller.cnfpass1.value = true;
//
//       return false;
//     } else if (controller.countrytxt.text.trim().isEmpty) {
//       print('country is empty');
//       controller.confirmpass.value = false;
//       controller.confirmemail.value = false;
//       controller.confirmnumber.value = false;
//       controller.passwordss.value = false;
//       controller.cnfpass1.value = false;
//
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.number.value = false;
//       controller.number1.value = false;
//       controller.address.value = false;
//       controller.country.value = true;
//
//       return false;
//     } else if (controller.citytxt.text.trim().isEmpty) {
//       print('city is empty');
//       controller.confirmpass.value = false;
//       controller.confirmemail.value = false;
//       controller.confirmnumber.value = false;
//       controller.passwordss.value = false;
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.number.value = false;
//       controller.number1.value = false;
//       controller.address.value = false;
//       controller.country.value = false;
//       controller.city.value = true;
//
//       return false;
//     } else if (controller.phonetxt.text.trim().isEmpty) {
//       print('phone number is empty');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.confirmpass.value = false;
//       controller.confirmnumber.value = true;
//       controller.city.value = false;
//       controller.number.value = true;
//
//       return false;
//     } else if (controller.phonetxt.text.trim().length < 11) {
//       print('password does not match');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.number.value = false;
//       controller.confirmnumber.value = true;
//
//       controller.number1.value = true;
//
//       return false;
//     } else if (controller.addtxt.text.trim().isEmpty) {
//       print('address is empty');
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.number.value = false;
//       controller.number1.value = false;
//       controller.confirmpass.value = false;
//       controller.confirmemail.value = false;
//       controller.confirmnumber.value = false;
//       controller.passwordss.value = false;
//       controller.address.value = true;
//
//       return false;
//     } else {
//       controller.confirmpass.value = false;
//       controller.confirmemail.value = false;
//       controller.confirmnumber.value = false;
//       controller.passwordss.value = false;
//       controller.name.value = false;
//       controller.lname.value = false;
//       controller.showTooltip.value = false;
//       controller.email.value = false;
//       controller.password.value = false;
//       controller.password1.value = false;
//       controller.number.value = false;
//       controller.number1.value = false;
//       controller.address.value = false;
//       controller.country.value = false;
//       controller.city.value = false;
//       return true;
//     }
//   }
//
//   print(phone) async {
//     await print(phone);
//   }
//
//   String checkingemail = 'Phone number already exist';
//
//   Future check(String phone) async {
//     if (_validateUserData()) {
//       await controller.getdata(
//           controller.fName.text.trim(),
//           controller.lName.text.trim(),
//           controller.emailtxt.text.trim(),
//           controller.addtxt.text.trim(),
//           controller.citytxt.text.trim(),
//           controller.passtxt.text.trim(),
//           controller.phonetxt.text.trim(),
//           'sdfdfvsdfsdf');
//     } else {
//       return null;
//     }
//   }
// }
//
// Padding emailandpass(
//   TextEditingController textEditingController,
//   bool val,
//   bool val1,
//   bool icon,
//   String hint,
//   String text,
//   String text1,
//   TextInputType textinputtype,
//   bool pass,
//   List<TextInputFormatter> inputFormatters,
//   FocusNode focusNode,
//   Function(String) onFieldSubmitted,
//   bool enable,
//   TextInputAction textInputAction,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
//     child: Container(
//       height: 50,
//       child: Stack(
//         overflow: Overflow.visible,
//         children: [
//           Positioned(
//             child: TextFormField(
//               textInputAction: textInputAction,
//               enabled: true,
//               focusNode: focusNode,
//               controller: textEditingController,
//               inputFormatters: inputFormatters,
//               obscureText: pass,
//               keyboardType: textinputtype,
//               onFieldSubmitted: onFieldSubmitted,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(0),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 hintStyle: TextStyle(color: Colors.black),
//                 labelText: hint,
//                 labelStyle: TextStyle(color: Colors.black),
//                 suffixIcon: icon
//                     ? Icon(
//                         Icons.error,
//                         color: Colors.red,
//                       )
//                     : null,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 10,
//             //You can use your own custom tooltip widget over here in place of below Container
//             child: val
//                 ? Container(
//                     width: 250,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Center(
//                       child: Text(
//                         text,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   )
//                 : Container(),
//           ),
//           Positioned(
//             top: 30,
//             right: 10,
//             //You can use your own custom tooltip widget over here in place of below Container
//             child: val1
//                 ? Container(
//                     width: 250,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Center(
//                       child: Text(
//                         text1,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Padding NameTextField(
//   TextEditingController controller,
//   String text,
//   String hint,
//   TextInputType txt,
//   bool trueorfalse,
//   FocusNode focusNode,
//   Function(String) onFieldSubmitted,
//   TextInputAction textInputAction,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
//     child: Container(
//       height: 50,
//       child: Stack(
//         overflow: Overflow.visible,
//         children: [
//           Positioned(
//             child: TextFormField(
//               textInputAction: textInputAction,
//               onFieldSubmitted: onFieldSubmitted,
//               focusNode: focusNode,
//               controller: controller,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(0),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 hintStyle: TextStyle(color: Colors.black),
//                 labelText: hint,
//                 labelStyle: TextStyle(color: Colors.black),
//                 suffixIcon: trueorfalse
//                     ? Icon(
//                         Icons.error,
//                         color: Colors.red,
//                       )
//                     : null,
//               ),
//               keyboardType: txt,
//             ),
//           ),
//           Positioned(
//             top: 30,
//             right: 10,
//             //You can use your own custom tooltip widget over here in place of below Container
//             child: trueorfalse
//                 ? Container(
//                     width: 250,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Center(
//                       child: Text(
//                         text,
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   )
//                 : Container(),
//           )
//         ],
//       ),
//     ),
//   );
// }
//
// Padding countrycode(
//   TextEditingController controller,
//   String hint,
//   TextInputType txt,
//   FloatingLabelBehavior floatingLabelBehavior,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
//     child: Container(
//       height: 50,
//       child: Stack(
//         overflow: Overflow.visible,
//         children: [
//           Positioned(
//             child: TextFormField(
//               controller: controller,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(0),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black, width: 1.4),
//                 ),
//                 hintStyle: TextStyle(color: Colors.black),
//                 labelText: hint,
//                 labelStyle: TextStyle(color: Colors.black),
//               ),
//               keyboardType: txt,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trollyproject/UI/login.dart';
import 'package:trollyproject/apivalidation.dart';
import 'package:trollyproject/controllers/Network/network.dart';
import 'package:trollyproject/controllers/ProfileController.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';
import 'package:trollyproject/model/loginandsignup.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginPage extends StatelessWidget {
  CustomValidator controller = Get.put(CustomValidator());

  GlobalKey<FormState> _formKey = GlobalKey();
  launchURL() async {
    const url = 'https://app.trolleymate.co.uk/terms.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';


  @override
  Widget build(BuildContext context) {
    Orientation orientation =MediaQuery.of(context).orientation;
    return MaterialApp(
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
      home: Scaffold(
        body: SafeArea(
          child: Container(
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [

                    SizedBox(

                      height: MediaQuery.of(context).size.height * 0.25,
                    ),


                    GetX<CustomValidator>(
                        initState: (_) {},
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              NameTextField(controller.fName,
                                  'Please enter a valid name.', "First Name ", TextInputType.name, controller.name.value,controller.firstNameFocus,(term) {
                                    controller.firstNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.lastNameFocus);
                                  },TextInputAction.next ),
                              NameTextField(controller.lName,
                                  'Please enter a valid name.', "Last Name ",  TextInputType.name, controller.lname.value,controller.lastNameFocus ,(term) {
                                    controller.lastNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.emailNameFocus);
                                  },TextInputAction.next ),


                              emailandpass(controller.emailtxt,
                                  controller.emailvalidation.value,controller.emailvalidation1.value,controller.emailtextfieldicon.value,
                                  'Email or Phone',
                                  "Please enter a valid email.",
                                  "Please enter a valid email.",
                                  TextInputType.emailAddress,false,  null,controller.emailNameFocus ,(term) {
                                    controller.emailNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.passNameFocus);
                                  },true ,TextInputAction.next,controller.showemailarrow.value,

                                controller.showemailarrow1.value,

                              ),




                              emailandpass(controller.passtxt,controller.passwordvalidation.value,controller.passwordvalidation1.value,controller.passtextfieldicon.value, 'Password', "Please enter a password.", "Password must be 6 character and above", null, true, null,controller.passNameFocus ,

                                      (term) {
                                    controller.passNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.cnfNameFocus);
                                  },true,TextInputAction.next,controller.showpasswordarrow.value,controller.showepasswordarrow1.value,
                              ),




                                  Center(
                                    child: Visibility(

                                        child: CircularProgressIndicator(
                                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),


                                        ),


                                    visible: controller.circular.value,
                                    ),
                                  ),






                              emailandpass(controller.cnftxt,controller.cnfpassvalidation.value,controller.cnfpassvalidation1.value,controller.cnfpasstextfieldicon.value, 'Confirm Password', " Confirm Password does not match.", " Confirm Password does not match.", null, true, null,controller.cnfNameFocus,

                                      (term) {
                                    controller.cnfNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.countryNameFocus );
                                  },true,TextInputAction.next,controller.showcnfpassarrow.value,controller.showcnfpassarrow1.value

                              ),





















                              Padding(
                          padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 17,),
                             child: Container(
                                    // color: Colors.red,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 2, color: Colors.black))),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Text(
                                            'Select Country',
                                            style:
                                                TextStyle(color: Colors.black45),
                                          ),
                                        ),
                                        country(),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                          ),

                                ),
                           ),
                              NameTextField(controller.citytxt, 'Please select valid city.', 'City',TextInputType.text, controller.city.value,controller.cityNameFocus,   (term) {
                                controller.countryNameFocus.unfocus();
                                FocusScope.of(context).requestFocus(controller.addNameFocus );
                              },TextInputAction.next  ),

                              Row(

                                children: [

                                  Expanded(


                                    child: countrycode(controller.countryCode, 'Mobile No.', TextInputType.phone,),
                                    flex: 1,

                                  ),



                                  Expanded(
                                    child: phonenumber(controller.phonetxt,controller.phonevalidation.value,controller.phonevalidation1.value,controller.phonetextfieldicon.value, 'Number', "Please enter a mobile number length.", 'Please enter a mobile number length 11or11digits.', TextInputType.phone, false, [
                                      LengthLimitingTextInputFormatter(16),

                                    ],controller.phoneNameFocus,(term) {
                                      controller.phoneNameFocus.unfocus();
                                      FocusScope.of(context).requestFocus(controller.addNameFocus );
                                    },true ,TextInputAction.next ,controller.showephonearrow.value,controller.showephonearrow1.value,),flex: 3,
                                  ),



                                ],
                              ),

                              NameTextField(controller.addtxt,  "Kindly Enter Address", 'Address',   TextInputType.text, controller.address.value,controller.addNameFocus ,

                                      (term) {
                                    controller.addNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.submit );
                                  },TextInputAction.done
                              ),

                            Padding(padding: EdgeInsets.only(left: 5),child:    CheckboxListTile(
                                      
                                      title: GestureDetector(
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                'By continuing, you agree to our ',
                                            style: TextStyle(
                                                fontSize: 11, letterSpacing: 1),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Terms & Condition',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  )),
                                              TextSpan(
                                                  text: ' and ',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                  )),
                                              TextSpan(
                                                  text: 'Privacy Policy',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  )),

                                              // can add more TextSpans here...
                                            ],
                                          ),
                                          maxLines: 2,
                                        ),
                                        onTap: () {
                                          launchURL();
                                        },
                                      ),
                                      contentPadding: EdgeInsets.all(0),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.red,
                                      value: controller.checkbox.value,
                                      dense:true,
                                      onChanged: (e) {
                                        controller.checkbox.value = e;
                                      })),






                            ],
                          );
                        }),


                  ],
                ),
              )),

        ),
        bottomNavigationBar:                               Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
          child: Container(
            width:Get.width,
            height: orientation==Orientation.portrait? Get.height*0.06:Get.height*0.123,
            child: ElevatedButton(
              focusNode: controller.submit,

              onPressed: ()  {
                print('asdnmbsnmd');
                check('gggg');
              },
              child: Text('Register'.toUpperCase()),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),
            ),
          ),
        ),

      ),
    );


  }
  Future<String> getcode(name) async{

    String names;
       names=name;

    controller.countryCode.text=names;



  }

  // bool _validateUserData() {
  //   RegExp regex = new RegExp(pattern);
  //
  //
  //   if (controller.fName.text.trim().isEmpty) {
  //     print('first name is missing');
  //
  //
  //
  //
  //     controller.confirmpass.value=false;
  //     controller.confirmemail.value=false;
  //     controller.confirmnumber.value=false;
  //     controller.passwordss.value=false;
  //
  //     controller.lname.value=false;
  //     controller.email.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.number1.value=false;
  //     controller.address.value=false;
  //     controller.country.value=false;
  //     controller.city.value=false;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //
  //
  //
  //     controller.name.value=true;
  //     return false;
  //   } else if (controller.lName.text.trim().isEmpty) {
  //     print('Last name is missing');
  //
  //     controller.lname.value=true;
  //
  //
  //
  //     controller.confirmpass.value=false;
  //     controller.confirmemail.value=false;
  //     controller.confirmnumber.value=false;
  //     controller.passwordss.value=false;
  //
  //     controller.name.value=false;
  //
  //     controller.email.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.number1.value=false;
  //     controller.address.value=false;
  //     controller.country.value=false;
  //     controller.city.value=false;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //     return false;
  //   }else if(controller.emailtxt.text.trim().isEmpty){
  //     print('email  is missing');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.email.value=true;
  //     controller.confirmemail.value=true;
  //     controller.showrediconemail.value=true;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //     return false;
  //
  //   }
  //
  //   else if(!regex.hasMatch(controller.emailtxt.text.trim())){
  //     print('email  not valid');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.email.value=false;
  //     controller.confirmemail.value=true;
  //     controller.email.value=true;
  //     controller.showrediconemail.value=true;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //     return false;
  //   }
  //
  //   else if(controller.passtxt.text.trim().isEmpty){
  //     print('password is empty');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.email.value=false;
  //     controller.email.value=false;
  //     controller.confirmemail.value=false;
  //     controller.passwordss.value=true;
  //     controller.password.value=true;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=true;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //     return false;
  //   }
  //   else if(controller.passtxt.text.trim().length<6){
  //     print('password is less than 6');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.showTooltip.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.passwordss.value=true;
  //     controller.password1.value=true;
  //
  //
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=true;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //     return false;
  //   }
  //
  //   // else if(controller.countrytxt.text.trim().isEmpty){
  //   //   print('country is empty');
  //   //   controller.confirmpass.value=false;
  //   //   controller.confirmemail.value=false;
  //   //   controller.confirmnumber.value=false;
  //   //   controller.passwordss.value=false;
  //   //   controller.cnfpass1.value=false;
  //   //
  //   //
  //   //   controller.name.value=false;
  //   //   controller.lname.value=false;
  //   //   controller.showTooltip.value=false;
  //   //   controller.email.value=false;
  //   //   controller.password.value=false;
  //   //   controller.password1.value=false;
  //   //   controller.number.value=false;
  //   //   controller.number1.value=false;
  //   //   controller.address.value=false;
  //   //   controller.country.value=true;
  //   //
  //   //
  //   //
  //   //
  //   //
  //   //
  //   //   return false;
  //   // }
  //   else if(controller.citytxt.text.trim().isEmpty){
  //     print('city is empty');
  //
  //     controller.city.value=true;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //     controller.confirmpass.value=false;
  //     controller.confirmemail.value=false;
  //     controller.confirmnumber.value=false;
  //     controller.passwordss.value=false;
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.number1.value=false;
  //     controller.address.value=false;
  //     controller.country.value=false;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //     return false;
  //   }
  //   else if(controller.phonetxt.text.trim().isEmpty){
  //     print('phone number is empty');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.showTooltip.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.confirmpass.value=false;
  //     controller.confirmnumber.value=true;
  //     controller.city.value=false;
  //     controller.number.value=true;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //
  //
  //     return false;
  //   }
  //
  //   else if(controller.phonetxt.text.trim().length<11){
  //     print('password does not match');
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.showTooltip.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.confirmnumber.value=true;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //     controller.number1.value=true;
  //
  //
  //
  //
  //     return false;
  //   }
  //
  //   else if(controller.addtxt.text.trim().isEmpty){
  //     print('address is empty');
  //
  //     controller.address.value=true;
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //     controller.confirmpass.value=false;
  //     controller.confirmemail.value=false;
  //     controller.confirmnumber.value=false;
  //     controller.passwordss.value=false;
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.showTooltip.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.number1.value=false;
  //
  //     controller.country.value=false;
  //     controller.city.value=false;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //
  //
  //
  //
  //
  //     return false;
  //   }
  //
  //
  //
  //
  //
  //   else{
  //     controller.confirmpass.value=false;
  //     controller.confirmemail.value=false;
  //     controller.confirmnumber.value=false;
  //     controller.passwordss.value=false;
  //     controller.name.value=false;
  //     controller.lname.value=false;
  //     controller.showTooltip.value=false;
  //     controller.email.value=false;
  //     controller.password.value=false;
  //     controller.password1.value=false;
  //     controller.number.value=false;
  //     controller.number1.value=false;
  //     controller.address.value=false;
  //     controller.country.value=false;
  //     controller.city.value=false;
  //     controller.showrediconemail.value=false;
  //     controller.showrediconpass.value=false;
  //     controller.showrediconphone.value=false;
  //     controller.showrediconcnf.value=false;
  //     return true;
  //
  //   }
  // }


  bool _validateUserData(){
    RegExp regex = new RegExp(pattern);
if(controller.fName.text.trim().isEmpty){

  controller.name.value=true;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;



  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;







  return false;
}


else if(controller.lName.text.trim().isEmpty){



  controller.name.value=false;

  controller.lname.value=true;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;

  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;









  return false;

}


else if(controller.emailtxt.text.trim().isEmpty){

  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = true;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = true;


  controller.showemailarrow.value = true;
  controller.showemailarrow1.value = false;

  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;


  return false;




}


else if(!regex.hasMatch(controller.emailtxt.text.trim())){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = true;
  controller.emailtextfieldicon.value = true;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = true;
  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;






}


else if(controller.passtxt.text.trim().isEmpty){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = true;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = true;
  controller.showpasswordarrow.value = true;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;






}

else if(controller.passtxt.text.trim().length<6){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = true;
  controller.passtextfieldicon.value = true;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = true;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;






}




else if(controller.cnftxt.text.trim().isEmpty){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = true;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = true;
  controller.showcnfpassarrow.value = true;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;






}

else if(controller.cnftxt.text.trim().length<=6){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = true;
  controller.cnfpasstextfieldicon.value = true;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = true;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;






}









else if(controller.citytxt.text.trim().isEmpty){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=true;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;
  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return false;



}


else if(controller.phonetxt.text.trim().isEmpty){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = true;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = true;
  controller.showephonearrow.value = true;
  controller.showephonearrow1.value = false;

  return false;






}

else if(controller.phonetxt.text.trim().length<=11){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;


  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = true;
  controller.phonetextfieldicon.value = true;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = true;

  return false;






}


else if(controller.addtxt.text.trim().isEmpty){
  controller.name.value=false;

  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=true;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;

  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;


  return false;



}


else if(controller.checkbox.value!=true){
  Fluttertoast.showToast(msg: 'Privacy field is missing');
  controller.name.value=false;


  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;



  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;
  return false;
}

else{


  controller.name.value=false;


  controller.lname.value=false;
  controller.city.value=false;
  controller.address.value=false;



  controller.emailvalidation.value = false;
  controller.emailvalidation1.value = false;
  controller.emailtextfieldicon.value = false;


  controller.showemailarrow.value = false;
  controller.showemailarrow1.value = false;



  controller.passwordvalidation.value = false;
  controller.passwordvalidation1.value = false;
  controller.passtextfieldicon.value = false;
  controller.showpasswordarrow.value = false;
  controller.showepasswordarrow1.value = false;



  controller.cnfpassvalidation.value = false;
  controller.cnfpassvalidation1.value = false;
  controller.cnfpasstextfieldicon.value = false;
  controller.showcnfpassarrow.value = false;
  controller.showcnfpassarrow1.value = false;



  controller.phonevalidation.value = false;
  controller.phonevalidation1.value = false;
  controller.phonetextfieldicon.value = false;
  controller.showephonearrow.value = false;
  controller.showephonearrow1.value = false;

  return true;







}




  }



  Future check(String phone) async{

    if(_validateUserData()){
      await controller.getdata(controller.fName.text.trim(), controller.lName.text.trim(), controller.emailtxt.text.trim(), controller.addtxt.text.trim(), controller.citytxt.text.trim(), controller.passtxt.text.trim(), controller.phonetxt.text.trim(),controller.countryCode.text.trim());
      // showregisterData();

    }
    else{
      return print('skjhdsjkdhsjk');
    }

  }
  CountryCodePicker country() {
    return CountryCodePicker(


      textOverflow: TextOverflow.visible,
      dialogSize: Size(350, 250),
      hideSearch: true,
      padding: EdgeInsets.all(0),
      alignLeft: true,
      initialSelection: 'TF',
      showCountryOnly: false,
      showFlag: false,
      showOnlyCountryWhenClosed: true,
      closeIcon: Icon(Icons.done),
      onChanged:(e){

        getcode(e.dialCode);


      },
      onInit: (code) {
        // print(code.dialCode);


        // print(controller.countryname.value);

      },


      favorite: ['+39', 'FR'],


    );
  }

}




Padding emailandpass(
    TextEditingController textEditingController,

    bool val,
    bool val1,
    bool icon,
    String hint,
    String text,
    String text1,
    TextInputType textinputtype,
    bool pass,
    List<TextInputFormatter> inputFormatters, FocusNode focusNode, Function(String) onFieldSubmitted,bool enable,
    TextInputAction textInputAction,
    bool showredicon,
    bool showredicon1,

    )


{
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child:
    Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(

              textInputAction: textInputAction,
              enabled: true,
              focusNode: focusNode,
              controller: textEditingController,
              inputFormatters: inputFormatters,
              obscureText: pass,
              keyboardType: textinputtype,


              onFieldSubmitted: onFieldSubmitted,

              decoration: InputDecoration(

                isDense: true,

                contentPadding: EdgeInsets.all(0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black,fontSize: 13),
                suffixIcon: icon
                    ? Icon(
                  Icons.error,
                  color: Colors.red,
                )
                    : null,
              ),
            ),
          ),
          Visibility(
            visible: showredicon,
            child: Positioned(
                top: 36,
                right: 3,
                child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
          ),
          Visibility(
            visible: showredicon1,
            child: Positioned(
                top: 36,
                right: 3,
                child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
          ),
          // Visibility(
          //   visible: showredicon,
          //   child: Positioned(
          //       top: 36,
          //       right: 3,
          //       child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
          // ),


          Positioned(
            top: 58,
            right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: val
                ? Container(
              width: 190,
              height: 40,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 2,color: Colors.red)),
                color: Colors.black,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : Container(),
          ),
          Positioned(
          top: 58,
          right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: val1
                ? Container(
              width: 190,
              height: 40,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 2,color: Colors.red)),
                color: Colors.black,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : Container(),
          ),
        ],
      ),

  );
}

Padding phonenumber(
    TextEditingController textEditingController,

    bool val,
    bool val1,
    bool icon,
    String hint,
    String text,
    String text1,
    TextInputType textinputtype,
    bool pass,
    List<TextInputFormatter> inputFormatters, FocusNode focusNode, Function(String) onFieldSubmitted,bool enable,
    TextInputAction textInputAction,
    bool showredicon,
    bool showredicon1,

    )


{
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child:  Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          child: TextFormField(

            textInputAction: textInputAction,
            enabled: true,
            focusNode: focusNode,
            controller: textEditingController,
            inputFormatters: inputFormatters,
            obscureText: pass,
            keyboardType: textinputtype,


            onFieldSubmitted: onFieldSubmitted,

            decoration: InputDecoration(

              isDense: true,

              contentPadding: EdgeInsets.all(0),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.4),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.4),
              ),
              hintStyle: TextStyle(color: Colors.black),
              labelText: hint,
              labelStyle:   TextStyle(color: Colors.black,fontSize: 13),
              suffixIcon: icon
                  ? Icon(
                Icons.error,
                color: Colors.red,
              )
                  : null,
            ),
          ),
        ),
        Visibility(
          visible: showredicon,
          child: Positioned(
              top: 36,
              right: 3,
              child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
        ),
        Visibility(
          visible: showredicon1,
          child: Positioned(
              top: 36,
              right: 3,
              child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
        ),
        // Visibility(
        //   visible: showredicon,
        //   child: Positioned(
        //       top: 36,
        //       right: 3,
        //       child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
        // ),


        Positioned(
          top: 58,
          right: -10,
          //You can use your own custom tooltip widget over here in place of below Container
          child: val
              ? Container(
            width: 190,
            height: 40,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 2,color: Colors.red)),
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
              : Container(),
        ),
        Positioned(
          top: 58,
          right: -10,
          //You can use your own custom tooltip widget over here in place of below Container
          child: val1
              ? Container(
            width: 210,
            height: 48,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 2,color: Colors.red)),
              color: Colors.black,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                text1,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
              : Container(),
        ),
      ],
    ),

  );
}




Padding NameTextField(
    TextEditingController controller,
    String text,
    String hint,

    TextInputType txt,

    bool trueorfalse,
    FocusNode focusNode,
    Function(String) onFieldSubmitted,
    TextInputAction textInputAction,



    ) {
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              textInputAction: textInputAction,
              onFieldSubmitted: onFieldSubmitted,
              focusNode: focusNode,
              controller: controller,
              decoration: InputDecoration(
                isDense: true,

                contentPadding: EdgeInsets.symmetric(vertical: 5),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black,                fontSize: 13
                ),                suffixIcon: trueorfalse
                  ? Icon(
                Icons.error,
                color: Colors.red,
              )
                  : null,
              ),

              keyboardType: txt,
            ),
          ),
          Visibility(
            visible: trueorfalse,
            child: Positioned(
                top: 36,
                right: 3,
                child: Icon(Icons.arrow_drop_up_outlined,size: 38,color: Colors.red,)),
          ),

          Positioned(
            top: 58,
            right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: trueorfalse
                ? Container(
              width: 210,
              height: 48,
              decoration: BoxDecoration(

                  border: Border(top: BorderSide(width: 2,color: Colors.red)),
                  color: Colors.black,

              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : Container(),
          )
        ],
      ),

  );





}

GetRegisterData getRegisterData = GetRegisterData();
ProfileController profileController = Get.put(ProfileController());

// Future<String> showregisterData() async{
//   for(int i=0;i<=Network().userdata.length;i++){
//
//
//   profileController.fName.text=Network().userdata[i].firstName;
//   print("this is model class${Network().userdata[i].firstName}");
//
//
//
//
//
//
//
//
//
//   }
//
//   print("hello this is post data${profileController.fName.text}");
// }

Padding countrycode(
    TextEditingController controller,
    String hint,

    TextInputType txt,


    ) {
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child:  Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(

              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                floatingLabelBehavior:FloatingLabelBehavior.always,

                contentPadding: EdgeInsets.all(0),

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black,fontSize: 13),
              ),

              keyboardType: txt,
            ),
          ),
        ],
      ),

  );}
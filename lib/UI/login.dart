import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/RegisterController.dart';
import 'package:trollyproject/controllers/logincontroller.dart';
import 'package:trollyproject/model/forgot.dart';

class Login extends StatelessWidget {
  RegisterControllers controller = Get.put(RegisterControllers());
  LoginController controllers = Get.put(LoginController());


  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> _formKeys = GlobalKey();

  String emailAndPhone;
  String password;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  Forgot forgot = Forgot();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    GetX<RegisterControllers>(
                        initState: (_) {},
                        builder: (controller) {
                          return Column(
                            children: [

                              emailsandpass(
                                  controllers.emailtxt,
                                  controller.emailvalidation.value,
                                  controller.emailvalidation1.value,
                                  controller.emailtextfieldicon.value,
                                  'Email or Phone',
                                  "Please enter a valid email or phone number.",
                                  "Please enter a valid email or phone number.",
                                  TextInputType.emailAddress,
                                  false,
                                  null,
                                  controllers.emailNameFocus, (term) {
                                controllers.emailNameFocus.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(controllers.passNameFocus);
                              },
                                  true,
                                  TextInputAction.next,
                                  controller.showemailarrow.value,
                                  controller.showemailarrow1.value,
                                  ValueKey('loginemail')),

                              emailandpass(
                                controllers.passtxt,
                                controller.passwordvalidation.value,
                                controller.passwordvalidation1.value,
                                controller.passtextfieldicon.value,
                                'Password',
                                "Please enter a password.",
                                "Password must be 6 character and above",
                                null,
                                true,
                                null,
                                controllers.passNameFocus,
                                (term) {
                                  controllers.passNameFocus.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(controllers.submit);
                                },
                                true,
                                TextInputAction.next,
                                controller.showpasswordarrow.value,
                                controller.showepasswordarrow1.value,
                                ValueKey('password'),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Language',
                                              style: TextStyle(
                                                  color: Colors.black45),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('English'),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                        onTap: () {
                                          Get.dialog(
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Container(
                                                height: Get.height * 0.1,
                                                color: Colors.white,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              left: 10,
                                                              bottom: 8),
                                                      child: Text(
                                                        'Select Language',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.75)),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0,
                                                              left: 22),
                                                      child: Text(
                                                        'English',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: Colors
                                                                .black54
                                                                .withOpacity(
                                                                    0.7)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ),
                                          );
                                        }),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 14.0),
                                      child: FlatButton(
                                          onPressed: () {
                                            showsDialog(
                                                context, controllers.resetPass);
                                          },
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
        child: Container(
          width: Get.width,
          height: orientation == Orientation.portrait
              ? Get.height * 0.06
              : Get.height * 0.123,
          child: ElevatedButton(
            focusNode: controllers.submit,
            onPressed: () {
              check();
            },
            child: Text('Login'.toUpperCase()),
            style: ElevatedButton.styleFrom(primary: Colors.red),
          ),
        ),
      ),
    );
  }



  bool _validateUserData() {
    RegExp regex = new RegExp(pattern);

    if (controllers.emailtxt.text.trim().isEmpty) {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = false;

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
    } else if (controllers.emailtxt.text.trim().length <= 11) {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = false;

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
    } else if (controllers.passtxt.text.trim().isEmpty) {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = false;

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
    } else if (controllers.passtxt.text.trim().length < 6) {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = false;

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
    } else {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = false;

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

  Future check() async {
    if (_validateUserData()) {
      controllers.getlogindata(
          controllers.emailtxt.text.trim(), controllers.passtxt.text.trim());
      print('finally done with login page ');
    }
  }

  bool showicon = false;

  showsDialog(BuildContext context, TextEditingController resetPass) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              child: AlertDialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 150),
                title: Form(
                  key: _formKeys,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'To reset your password, enter the email address you use to register.We will send code on email address.',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54.withOpacity(0.8),
                            decoration: TextDecoration.none),
                        maxLines: 3,
                      ),
                      TextFormField(
                        controller: controller.resetPass,
                        decoration: showicon
                            ? InputDecoration(
                                hintText: 'Email',
                                suffixIcon: showicon
                                    ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                    : Container(),
                              )
                            : InputDecoration(
                                hintText: 'Email',

                                //suffixIcon:   showicon?Icon(Icons.error,color: Colors.red,): Container(),
                              ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white),
                    ),
                    clipBehavior: Clip.none,
                    child: Text(
                      "Cancel".toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text("Ok".toUpperCase(),
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        RegExp regex = new RegExp(pattern);
                        if (controller.resetPass.text.trim().isEmpty) {
                          setState(() {
                            showicon = true;
                          });
                        } else {
                          showicon = false;
                          // String fora=forgot.email;
                          // print('${fora} first');
                          // controller.resetPass.text =fora;
                          print('${controller.resetPass.text} second');

                          controllers.passReset(controllers.resetPass.text);

                          print(controller.resetPass.text.trim());
                        }
                      }),
                ],
              ),
            );
          });
        });
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
    List<TextInputFormatter> inputFormatters,
    FocusNode focusNode,
    Function(String) onFieldSubmitted,
    bool enable,
    TextInputAction textInputAction,
    bool showredicon,
    bool showredicon1,
    Key key,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              key: key,
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
                labelStyle: TextStyle(color: Colors.black),
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
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 38,
                  color: Colors.red,
                )),
          ),
          Visibility(
            visible: showredicon1,
            child: Positioned(
                top: 36,
                right: 3,
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 38,
                  color: Colors.red,
                )),
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
                      border:
                          Border(top: BorderSide(width: 2, color: Colors.red)),
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
                    width: 240,
                    height: 48,
                    decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(width: 2, color: Colors.red)),
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

  Padding emailsandpass(
    TextEditingController textEditingController,
    bool val,
    bool val1,
    bool icon,
    String hint,
    String text,
    String text1,
    TextInputType textinputtype,
    bool pass,
    List<TextInputFormatter> inputFormatters,
    FocusNode focusNode,
    Function(String) onFieldSubmitted,
    bool enable,
    TextInputAction textInputAction,
    bool showredicon,
    bool showredicon1,
    Key key,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              key: key,
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
                labelStyle: TextStyle(color: Colors.black),
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
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 38,
                  color: Colors.red,
                )),
          ),
          Visibility(
            visible: showredicon1,
            child: Positioned(
                top: 36,
                right: 3,
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 38,
                  color: Colors.red,
                )),
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
                    width: 240,
                    height: 48,
                    decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(width: 2, color: Colors.red)),
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
                    width: 240,
                    height: 48,
                    decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(width: 2, color: Colors.red)),
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
}

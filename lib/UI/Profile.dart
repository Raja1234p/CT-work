import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trollyproject/controllers/ProfileController.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/RegisterController.dart';

class Profile extends StatelessWidget {
  RegisterControllers controller = Get.put(RegisterControllers());

  ProfileController controllers = Get.put(ProfileController());
  GlobalKey<FormState> _formKeys = GlobalKey();
  bool showicon = false;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child:   Obx(()=> controllers.enableAndDiableTextField.value?IconButton(icon: Icon(Icons.check,color: Colors.black,),
                focusNode: controllers.focusNode,
                onPressed: (){
                if(_validateUserData()){
                  print('check working');
                passordDialog(context);

                }
                // else if(validdatePasswords()){
                //   passordDialog(context);
                //
                //
                // }
                else{
                  print('not working');
                }


            }): Icon(Icons.edit,color: Colors.black,),),
            onTap: (){
              print('hello');
              controllers.enableAndDiableTextField.value=true;
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.2),
                 Obx(()=> NameTextField(
                      controllers.fName,
                      'Please enter a valid name.',
                      "First Name ",
                      TextInputType.name,
                      controller.name.value,
                      controllers.firstNameFocus, (term) {
                    controllers.firstNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(controllers.lastNameFocus);
                  }, TextInputAction.next,
                      controllers.enableAndDiableTextField.value),),
              Obx(()=>   NameTextField(
                      controllers.lName,
                      'Please enter a valid name.',
                      "Last Name ",
                      TextInputType.name,
                      controller.lname.value,
                      controllers.lastNameFocus, (term) {
                    controllers.lastNameFocus.unfocus();
                    FocusScope.of(context)
                        .requestFocus(controllers.emailNameFocus);
                  }, TextInputAction.next,
                      controllers.enableAndDiableTextField.value),),
                  Obx(()=>   emailandpass(
                      controllers.emailtxt,
                      controller.emailvalidation.value,
                      controller.emailvalidation1.value,
                      controller.emailtextfieldicon.value,
                      'Email or Phone',
                      "Please enter a valid email.",
                      "Please enter a valid email.",
                      TextInputType.emailAddress,
                      false,
                      null,
                      controllers.emailNameFocus, (term) {
                    controllers.emailNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(controllers.phoneNameFocus);
                  },
                      true,
                      TextInputAction.next,
                      controller.showemailarrow.value,
                      controller.showemailarrow1.value,
                      controllers.enableAndDiableTextField.value),),
              Obx(()=>      Row(
                    children: [
                      Expanded(
                        child: countrycode(
                            controllers.countryCode,
                            'Mobile No.',
                            TextInputType.phone,
                            controllers.enableAndDiableTextField.value),
                        flex: 1,
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Expanded(
                        child: emailandpass(
                            controllers.phonetxt,
                            controller.phonevalidation.value,
                            controller.phonevalidation1.value,
                            controller.phonetextfieldicon.value,
                            'Number',
                            "Please enter a mobile number length.",
                            'Please enter a mobile number length 11or11 digits.',
                            TextInputType.phone,
                            false,
                            [
                              LengthLimitingTextInputFormatter(16),
                            ],
                            controllers.phoneNameFocus, (term) {
                          controllers.phoneNameFocus.unfocus();
                          FocusScope.of(context)
                              .requestFocus(controllers.addNameFocus);
                        },
                            true,
                            TextInputAction.next,
                            controller.showephonearrow.value,
                            controller.showephonearrow1.value,
                            controllers.enableAndDiableTextField.value),
                        flex: 3,
                      ),
                    ],
                  ),),
              Obx(()=>   NameTextField(
                      controllers.addtxt,
                      "Kindly Enter Address",
                      'Address',
                      TextInputType.text,
                      controller.address.value,
                      controllers.addNameFocus, (term) {
                    controllers.addNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(controllers.newpass);
                  }, TextInputAction.done,
                      controllers.enableAndDiableTextField.value)),
                  Obx(() => controllers.enableAndDiableTextField.value
                      ? TextButton(
                          style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(0))),
                          onPressed: () {
                            print('hello');
                            controllers.setPassToggle();
                          },
                          child: Text(
                            'Change Password?',
                            style: TextStyle(color: Colors.red),
                          ))
                      : TextButton(
                          style: ButtonStyle(
                              shadowColor:
                                  MaterialStateProperty.all(Colors.white),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(0))),
                          onPressed: () {
                            print('hello');
                          },
                          child: Text(
                            'Change Password?',
                            style: TextStyle(color: Colors.red),
                          ))),
                  Obx(
                    () => Visibility(
                        visible: controllers.enableAndDiablepassfield.value,
                        child: Column(
                          children: [
                            newpassword(
                                controllers.newPassword,
                                controller.passwordvalidation.value,
                                controller.passwordvalidation1.value,
                                controller.passtextfieldicon.value,
                                'Password',
                                "Please enter a password.",
                                "Password must be 6 character and above",
                                null,
                                true,
                                null,
                                controllers.newpass, (term) {
                              controllers.newpass.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(controller.cnfNameFocus);
                            },
                                true,
                                TextInputAction.next,
                                controller.showpasswordarrow.value,
                                controller.showepasswordarrow1.value,
                                ),
                            confirmNewPass(
                                controllers.cnftxt,
                                controller.cnfpassvalidation.value,
                                controller.cnfpassvalidation1.value,
                                controller.cnfpasstextfieldicon.value,
                                'Confirm Password',
                                " Your confirm password does't match with new password.",
                                " Confirm Password does not match.",
                                null,
                                true,
                                null,
                                controllers.cnfnewpass, (term) {
                              controllers.cnfnewpass.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(controllers.focusNode);
                            },
                                true,
                                TextInputAction.done,
                                controller.showcnfpassarrow.value,
                                controller.showcnfpassarrow1.value,
                                ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  passordDialog(BuildContext context) {
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
                        'Verify Account',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Please enter a password which is used in register to verify your account',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54.withOpacity(0.8),
                            decoration: TextDecoration.none),
                        maxLines: 3,
                      ),
                      Stack(overflow: Overflow.visible, children: [
                        TextFormField(
                          key: ValueKey('passsssss'),
                          obscureText: true,
                          cursorColor: Colors.black,
                          controller: controllers.passtxt,
                          autofocus: true,
                          decoration: showicon
                              ? InputDecoration(
                                  enabled: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: 'Pawword',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  suffixIcon: showicon
                                      ? Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        )
                                      : Container(),
                                )
                              : InputDecoration(
                                  enabled: true,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,

                                  //suffixIcon:   showicon?Icon(Icons.error,color: Colors.red,): Container(),
                                ),
                        ),
                        Visibility(
                          visible: showicon,
                          child: Positioned(
                              top: 35,
                              right: 3,
                              child: Icon(
                                Icons.arrow_drop_up_outlined,
                                size: 45,
                                color: Colors.red,
                              )),
                        ),
                        Positioned(
                          top: 60,
                          right: -15,
                          //You can use your own custom tooltip widget over here in place of below Container
                          child: showicon
                              ? Container(
                                  width: 180,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 2, color: Colors.red)),
                                    color: Colors.black,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      'Invalid Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ]),
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
                      onPressed: () async {
                        if (controllers.passtxt.text.trim().isEmpty) {
                          setState(() {
                            showicon = true;
                          });

                          Fluttertoast.showToast(
                              msg: 'Invalid Password',
                              backgroundColor: Colors.black54,
                              textColor: Colors.white);
                        } else {
                          setState(() {
                            showicon = false;
                          });
                          SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          controllers.postUpdate(
                              controllers.fName.text.trim(),
                              controllers.lName.text.trim(),
                              controllers.cnftxt.text.trim(),
                              controllers.phonetxt.text.trim(),
                              controllers.emailtxt.text.trim(),
                              controllers.passtxt.text.trim(),
                              sharedPreferences.getString('token_id'),
                              sharedPreferences.getString('user_id'));
                          Fluttertoast.showToast(
                              msg: 'Thanks',
                              backgroundColor: Colors.black54,
                              textColor: Colors.white);
                          print(
                              " all new password field ok ${controllers.newPassword.text.trim()},");
                          // String fora=forgot.email;
                          // print('${fora} first');
                          // controller.resetPass.text =fora;

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
    bool curentlydisable,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              textInputAction: textInputAction,
              enabled: curentlydisable,
              focusNode: focusNode,
              controller: textEditingController,
              inputFormatters: inputFormatters,
              obscureText: pass,
              keyboardType: textinputtype,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(
                enabled: curentlydisable,
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
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



  Padding newpassword(
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
      ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              textInputAction: textInputAction,
              focusNode: focusNode,
              controller: textEditingController,
              inputFormatters: inputFormatters,
              obscureText: pass,
              keyboardType: textinputtype,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
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






  Padding confirmNewPass(
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
      ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              textInputAction: textInputAction,
              focusNode: focusNode,
              controller: textEditingController,
              inputFormatters: inputFormatters,
              obscureText: pass,
              keyboardType: textinputtype,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(

                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                suffixIcon: icon
                    ? Icon(
                  Icons.error,size: 25,
                  color: Colors.red,
                )
                    : null,
              ),
            ),
          ),
          Visibility(
            visible: showredicon,
            child: Positioned(
                top:-24,
                right: 3,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 38,
                  color: Colors.red,
                )),
          ),
          Visibility(
            visible: showredicon1,
            child: Positioned(
                top: -36,
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
            top: -58,
            right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: val
                ? Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                border:
                Border(bottom: BorderSide(width: 2, color: Colors.red)),
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
            top: -58,
            right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: val1
                ? Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                border:
                Border(bottom: BorderSide(width: 2, color: Colors.red)),
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
    bool curentlydisable,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                enabled: curentlydisable,
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                suffixIcon: trueorfalse
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
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 38,
                  color: Colors.red,
                )),
          ),
          Positioned(
            top: 58,
            right: -10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: trueorfalse
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
          )
        ],
      ),
    );
  }

  Padding countrycode(
    TextEditingController controller,
    String hint,
    TextInputType txt,
    bool curentlydisable,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              enabled: curentlydisable,
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: EdgeInsets.all(0),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle: TextStyle(color: Colors.black, fontSize: 13),
              ),
              keyboardType: txt,
            ),
          ),
        ],
      ),
    );
  }

  bool _validateUserData() {
    RegExp regex = new RegExp(pattern);
    if (controllers.fName.text.trim().isEmpty) {
      controller.name.value = true;

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

      return false;
    } else if (controllers.lName.text.trim().isEmpty) {
      controller.name.value = false;

      controller.lname.value = true;
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

      return false;
    } else if (controllers.emailtxt.text.trim().isEmpty) {
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
    } else if (!regex.hasMatch(controllers.emailtxt.text.trim())) {
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
    }











    else if (controllers.phonetxt.text.trim().isEmpty) {
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

      controller.phonevalidation.value = true;
      controller.phonevalidation1.value = false;
      controller.phonetextfieldicon.value = true;
      controller.showephonearrow.value = true;
      controller.showephonearrow1.value = false;

      return false;
    } else if (controllers.phonetxt.text.trim().length <= 11) {
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
      controller.phonevalidation1.value = true;
      controller.phonetextfieldicon.value = true;
      controller.showephonearrow.value = false;
      controller.showephonearrow1.value = true;

      return false;
    } else if (controllers.addtxt.text.trim().isEmpty) {
      controller.name.value = false;

      controller.lname.value = false;
      controller.city.value = false;
      controller.address.value = true;

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
    } if(controllers.newPassword.text.trim().isEmpty){
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

    else if(controllers.newPassword.text.trim().length<6){
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




    else if(controllers.cnftxt.text.trim().isEmpty){
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

    else if(controllers.cnftxt.text.trim().length<=6){
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






    else {
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
}

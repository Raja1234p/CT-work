import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';

class Login extends StatelessWidget {
  CustomValidator controller = Get.put(CustomValidator());

  GlobalKey<FormState> _formKey = GlobalKey();
  String emailAndPhone;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,

          child: Form(
            key: _formKey,
            child:
            SingleChildScrollView(
              child: GetX<CustomValidator>(
                  initState: (_){

                  },
                  builder: (controller) {
                    return Column(
                      children: [

                        SizedBox(
                          height: Get.height*0.2,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            height: 80,
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Positioned(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,

                                    onChanged: (value) {
                                      emailAndPhone = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.showTooltip.value = true;

                                        return "";
                                      } else if (!value.contains('@')) {
                                        controller.email.value = true;
                                        return '';
                                      } else if (!value.isEmpty) {
                                        if (value.contains('@')) {
                                          controller.email.value = false;
                                        }

                                        controller.showTooltip.value = false;
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),

                                      hintStyle: TextStyle(color: Colors.black),
                                      hintText: 'Email or Phone',
                                      suffixIcon: controller.showTooltip.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.showTooltip.value
                                      ? Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        "Kindly Enter Your Mail.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                                Obx(() => Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.email.value
                                      ? Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        "Invalid Email.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                )),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            height: 100,
                            child: Stack(
                              children: [
                                Positioned(
                                  child: TextFormField(

                                    onChanged: (value) {
                                      password = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.password.value = true;

                                        return "";
                                      }


                                      else if (!value.isEmpty) {
                                        controller.password.value = false;
                                        if (value.length >= 6) {
                                          controller.password1.value = false;
                                        }
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),

                                      hintStyle: TextStyle(color: Colors.black),
                                      hintText: 'Password',
                                      suffixIcon: controller.password.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.password.value
                                      ? Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        "Password is empty.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.password1.value
                                      ? Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    child: Center(
                                      child: Text(
                                        "Password Length less than 6.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                        ),




                        SizedBox(height: Get.height*0.06,),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {

                              print('Done');
                            }
                          },
                          child: Text('Click Here'),
                        ),
                        SizedBox(height: Get.height*0.06,),

                      ],
                    );
                  }
              ),
            ),

          )
      ),

    );
  }
}

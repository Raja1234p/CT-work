import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';

class LoginPage extends StatelessWidget {
  CustomValidator controller = Get.put(CustomValidator());

  GlobalKey<FormState> _formKey = GlobalKey();

  String fName;

  String emailAndPhone;
  String password;
  String lName;
  String cnfPass;
  String phone;
  String address;
  String country;
  String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: GetX<CustomValidator>(
                  initState: (_) {},
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.2,
                        ),
                        NameTextField(controller.name.value,
                            'First Name is Empty', "First Name ", (value) {
                          if (value.isEmpty) {
                            controller.name.value = true;

                            return "";
                          } else if (!value.isEmpty) {
                            controller.name.value = false;
                          } else {
                            return null;
                          }
                        }, TextInputType.name, null, fName),
                        NameTextField(controller.lname.value,
                            'Last Name is Empty', "Last Name ", (value) {
                          if (fName == null) {
                            controller.lname.value == false;
                          } else if(!fName.isEmpty){
                            if (value.isEmpty) {
                              controller.lname.value = true;

                              return "";
                            } else if (!value.isEmpty) {
                              controller.lname.value = false;
                            } else {
                              return null;
                            }
                          }
                        }, TextInputType.name, null, lName),

                        // emailandpass(
                        //     controller.showTooltip.value,controller.email.value,
                        //     'Email or Phone',
                        //     "Kindly Enter Your Mail.",
                        //     "Invalid Email.",
                        //     TextInputType.emailAddress,false,  (value) {
                        //   if (value.isEmpty) {
                        //     controller.showTooltip.value = true;
                        //
                        //     return "";
                        //   } else if (!value.contains('@')) {
                        //     controller.email.value = true;
                        //     return '';
                        //   } else if (!value.isEmpty) {
                        //     if (value.contains('@')) {
                        //       controller.email.value = false;
                        //     }
                        //
                        //     controller.showTooltip.value = false;
                        //   } else {
                        //     return null;
                        //   }
                        // },emailAndPhone,null),
                        //
                        // emailandpass(controller.password.value,controller.password1.value, 'Password', "Password is empty.", "Password Length less than 6.", null, true, (value) {
                        //   if (value.isEmpty) {
                        //     controller.password.value = true;
                        //
                        //     return "";
                        //   } else if (!value.isEmpty) {
                        //     controller.password.value = false;
                        //     if (value.length >= 6) {
                        //       controller.password1.value = false;
                        //     }
                        //   } else {
                        //     return null;
                        //   }
                        // },password,null),
                        //
                        //
                        //
                        //
                        // emailandpass(controller.cnfpass.value,controller.cnfpass1.value, 'Confirm Password', " Confirm Password is empty.", "Confrim Password Does not Match", null, true, (value) {
                        //
                        //   if (value.isEmpty) {
                        //     // ignore: missing_return
                        //     controller.cnfpass.value = true;
                        //     return '';
                        //   } else if (value != password) {
                        //     controller.cnfpass1.value = true;
                        //
                        //   } else if (!value.isEmpty) {
                        //     controller.cnfpass.value = false;
                        //     if (value == password) {
                        //       controller.cnfpass1.value = false;
                        //     }
                        //   } else {
                        //     return null;
                        //   }
                        // },cnfPass,null
                        //   ),
                        //
                        //
                        // NameTextField(controller.country.value, "Kindly Select Country.", 'Country', (value) {
                        //   if (value.isEmpty) {
                        //     controller.country.value = true;
                        //
                        //     return "";
                        //   } else if (!value.isEmpty) {
                        //     controller.country.value = false;
                        //   } else {
                        //     return null;
                        //   }
                        // }, TextInputType.name, null,country),
                        // NameTextField(controller.city.value, 'Kindly Select Your City.', 'City', (value) {
                        //   if (value.isEmpty) {
                        //     controller.city.value = true;
                        //
                        //     return "";
                        //   } else if (!value.isEmpty) {
                        //     controller.city.value = false;
                        //   } else {
                        //     return null;
                        //   }
                        // }, TextInputType.text, null,city),
                        //
                        // emailandpass(controller.number.value,controller.number1.value, 'Number', "Kindly Number.", 'Phone Number is not Valid', TextInputType.phone, false,(value) {
                        //   if (value.isEmpty) {
                        //     controller.number.value = true;
                        //
                        //     return "";
                        //   } else if (value.length != 11) {
                        //     controller.number1.value = true;
                        //     return '';
                        //   } else if (!value.isEmpty) {
                        //     controller.number.value = false;
                        //
                        //     if (value.length == 11) {
                        //       controller.number1.value = false;
                        //     }
                        //   } else {
                        //     return null;
                        //   }
                        // },phone, [
                        //   LengthLimitingTextInputFormatter(11),
                        // ],),
                        //
                        // NameTextField(controller.address.value,  "Kindly Enter Address", 'Address',  (value) {
                        //   if (value.isEmpty) {
                        //     controller.address.value = true;
                        //
                        //     return "";
                        //   } else if (!value.isEmpty) {
                        //     controller.address.value = false;
                        //   } else {
                        //     return null;
                        //   }
                        // }, TextInputType.text, null,address),

                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              controller.getdata(fName, lName, emailAndPhone,
                                  address, city, password, phone);
                              print('Done');
                              print(country);
                            }
                          },
                          child: Text('Click Here'),
                        ),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                      ],
                    );
                  }),
            ),
          )),
    );
  }

  Padding emailandpass(
      bool controller,
      bool controllers,
      String hint,
      String text,
      String text1,
      TextInputType textinputtype,
      bool pass,
      Function(String) validate,
      String txtfieldValue,
      List<TextInputFormatter> inputFormatters) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child: TextFormField(
                inputFormatters: inputFormatters,
                obscureText: pass,
                keyboardType: textinputtype,
                onChanged: (value) {
                  txtfieldValue = value;
                },
                validator: validate,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: hint,
                  suffixIcon: controller
                      ? Icon(
                          Icons.error,
                          color: Colors.red,
                        )
                      : null,
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              //You can use your own custom tooltip widget over here in place of below Container
              child: controller
                  ? Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
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
              top: 30,
              right: 10,
              //You can use your own custom tooltip widget over here in place of below Container
              child: controllers
                  ? Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
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
      ),
    );
  }

  Padding NameTextField(
      bool controller,
      String text,
      String hint,
      Function(String) nnn,
      TextInputType txt,
      String text1,
      String txtfieldValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              child: TextFormField(
                validator: nnn,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: hint,
                  suffixIcon: controller
                      ? Icon(
                          Icons.error,
                          color: Colors.red,
                        )
                      : null,
                ),
                onChanged: (v) {
                  txtfieldValue = v;
                },
                keyboardType: txt,
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              //You can use your own custom tooltip widget over here in place of below Container
              child: controller
                  ? Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
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
      ),
    );
  }
}

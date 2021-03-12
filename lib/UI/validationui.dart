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


                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.name.value = true;

                                        return "";
                                      } else if (!value.isEmpty) {
                                        controller.name.value = false;
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
                                      hintText: 'First Name',
                                      suffixIcon: controller.name.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    onChanged: (v){
                                      fName=v;
                                    },
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                 Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.name.value
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
                                        "First Name is Empty",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                )
                              ],
                            ),
                          ),
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

                                    keyboardType: TextInputType.name,

                                    onChanged: (value) {
                                      lName = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.lname.value = true;

                                      } else if (!value.isEmpty) {
                                        controller.lname.value = false;
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
                                      hintText: 'Last Name',
                                      suffixIcon: controller.lname.value
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
                                  child: controller.lname.value
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
                                        "Kindly Enter Your Last Name.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            height: 80,
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                 Positioned(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      cnfPass = value;
                                    },
                                    validator: (value) {
                                      String r = password;
                                      if (value.isEmpty) {
                                        // ignore: missing_return
                                        controller.cnfpass.value = true;

                                      }

                                      else if(value!=password){
                                        controller.cnfpass1.value = true;
                                      }
                                      else if (!value.isEmpty) {
                                        controller.cnfpass.value = false;
                                      if(value==password){
                                        controller.cnfpass1.value = false;
                                      }

                                      }
                                        else {
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
                                      hintText: 'Confirm Password',
                                      suffixIcon: controller.cnfpass.value
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
                                  child: controller.cnfpass.value
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
                                        "Password is Empty",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                               Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.cnfpass1.value
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
                                        "Confrim Password Does not Match",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
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

                                    onChanged: (value) {
                                      country = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.country.value = true;

                                        return "";
                                      } else if (!value.isEmpty) {
                                        controller.country.value = false;
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
                                      hintText: 'Select Country',
                                      suffixIcon: controller.country.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.country.value
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
                                        "Kindly Select Country.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
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
                                    onChanged: (value) {
                                      city = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.city.value = true;

                                        return "";
                                      } else if (!value.isEmpty) {
                                        controller.city.value = false;
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
                                      hintText: 'City',
                                      suffixIcon: controller.city.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.city.value
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
                                        "Kindly Select Your City.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
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
                                    onChanged: (value) {
                                      phone = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.number.value = true;

                                        return "";
                                      } else if (value.length != 11) {
                                        controller.number1.value = true;
                                        return '';
                                      } else if (!value.isEmpty) {
                                        controller.number.value = false;

                                        if (value.length == 11) {
                                          controller.number1.value = false;
                                        }
                                      } else {
                                        return null;
                                      }
                                    },
                      inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      ],
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 1.4),
                                      ),

                                      hintStyle: TextStyle(color: Colors.black),
                                      hintText: 'Number',
                                      suffixIcon: controller.number.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                                 Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.number.value
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
                                        "Kindly Number.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                                 Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.number1.value
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
                                        "Phone Number is not Valid.",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
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
                                    onChanged: (value) {
                                      address = value;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        controller.address.value = true;

                                        return "";
                                      } else if (!value.isEmpty) {
                                        controller.address.value = false;
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
                                      hintText: 'Address',
                                      suffixIcon: controller.address.value
                                          ? Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      )
                                          : null,
                                    ),
                                    keyboardType: TextInputType.streetAddress,
                                  ),
                                ),
                                 Positioned(
                                  top: 50,
                                  right: 10,
                                  //You can use your own custom tooltip widget over here in place of below Container
                                  child: controller.address.value
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
                                        "Kindly Enter Address",
                                      ),
                                    ),
                                  )
                                      : Container(),
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: Get.height*0.06,),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              controller.getdata(fName,lName,emailAndPhone,address,city,password,phone);
                              print('Done');
                              print(country);
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

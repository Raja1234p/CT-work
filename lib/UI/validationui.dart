import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trollyproject/UI/login.dart';
import 'package:trollyproject/apivalidation.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';


class LoginPage extends StatelessWidget {
  CustomValidator controller = Get.put(CustomValidator());

  GlobalKey<FormState> _formKey = GlobalKey();





  @override
  Widget build(BuildContext context) {
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

                      height: MediaQuery.of(context).size.height * 0.2,
                    ),


                    GetX<CustomValidator>(
                        initState: (_) {},
                        builder: (controller) {
                          return Column(
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
                                  controller.showTooltip.value,controller.email.value,controller.confirmemail.value,
                                  'Email or Phone',
                                  "Please enter a valid email.",
                                  "Please enter a valid email.",
                                  TextInputType.emailAddress,false,  null,controller.emailNameFocus ,(term) {
                                  controller.emailNameFocus.unfocus();
                                  FocusScope.of(context).requestFocus(controller.passNameFocus);
                                },true ,TextInputAction.next),

                              emailandpass(controller.passtxt,controller.password.value,controller.password1.value,controller.passwordss.value, 'Password', "Please enter a password.", "Password must be 6 character and above", null, true, null,controller.passNameFocus ,

                          (term) {
                          controller.passNameFocus.unfocus();
                          FocusScope.of(context).requestFocus(controller.cnfNameFocus);
                          },true,TextInputAction.next
                              ),




                              emailandpass(controller.cnftxt,controller.cnfpass.value,controller.cnfpass1.value,controller.confirmpass.value, 'Confirm Password', " Confirm Password does not match.", " Confirm Password does not match.", null, true, null,controller.cnfNameFocus,

                                    (term) {
                                      controller.cnfNameFocus.unfocus();
                                  FocusScope.of(context).requestFocus(controller.countryNameFocus );
                                },true,TextInputAction.next

                              ),


                              NameTextField(controller.countrytxt, "Kindly Select Country.", 'Country', TextInputType.name, controller.country.value,controller.countryNameFocus ,
                                    (term) {
                                  controller.countryNameFocus.unfocus();
                                  FocusScope.of(context).requestFocus(controller.cityNameFocus );
                                },TextInputAction.next ),
                              NameTextField(controller.citytxt, 'Please select valid city.', 'City',TextInputType.text, controller.city.value,controller.cityNameFocus,   (term) {
                                controller.countryNameFocus.unfocus();
                                FocusScope.of(context).requestFocus(controller.addNameFocus );
                              },TextInputAction.next  ),

                              Row(

                                children: [

                                  Expanded(


                                      child: countrycode(controller.countryCode, '+92', TextInputType.phone,),
                                  flex: 1,

                          ),
                                  Expanded(
                                    child: emailandpass(controller.phonetxt,controller.number.value,controller.number1.value,controller.confirmnumber.value, 'Number', "Please enter a mobiel number length.", 'Please enter a mobiel number length 11or11 digits.', TextInputType.phone, false, [
                                      LengthLimitingTextInputFormatter(16),

                                    ],controller.phoneNameFocus,(term) {
                                      controller.phoneNameFocus.unfocus();
                                      FocusScope.of(context).requestFocus(controller.addNameFocus );
                                    },true ,TextInputAction.next ),flex: 3,
                                  ),


                                ],
                              ),

                              NameTextField(controller.addtxt,  "Kindly Enter Address", 'Address',   TextInputType.text, controller.address.value,controller.addNameFocus ,

                                    (term) {
                                  controller.addNameFocus.unfocus();
                                  FocusScope.of(context).requestFocus(controller.submit );
                                },TextInputAction.done
                              ),

                              SizedBox(

                                height: Get.height * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),

                                child: Container(
                                  width:Get.width,
                                  height:Get.height*0.06,
                                  child: ElevatedButton(
                                    focusNode: controller.submit,

                                    onPressed: ()  {
                                      check('gggg');
                                    },
                                    child: Text('Register'.toUpperCase()),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(

                                height: Get.height * 0.06,
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  bool _validateUserData() {


    if (controller.fName.text.trim().isEmpty) {
      print('first name is missing');
      controller.name.value=true;
      return false;
    } else if (controller.lName.text.trim().isEmpty) {
      print('Last name is missing');
      controller.name.value=false;
      controller.lname.value=true;
      return false;
    }else if(controller.emailtxt.text.trim().isEmpty){
      print('email  is missing');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=true;
      controller.confirmemail.value=true;



      return false;

    }

    else if(!controller.emailtxt.text.trim().contains('@')){
      print('email  not valid');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.confirmemail.value=true;
      controller.email.value=true;
      return false;
    }

    else if(controller.passtxt.text.trim().isEmpty){
      print('password is empty');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.confirmemail.value=false;
      controller.passwordss.value=true;
      controller.password.value=true;

      return false;
    }
    else if(controller.passtxt.text.trim().length<6){
      print('password is less than 6');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.passwordss.value=true;
      controller.password1.value=true;


      return false;
    }
    else if(controller.cnftxt.text.trim().isEmpty){
      print('confirm password is empty');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.passwordss.value=false;
      controller.password1.value=false;
      controller.cnfpass.value=true;

      controller.confirmpass.value=true;


      return false;
    }

    else if(controller.cnftxt.text.trim()!=controller.passtxt.text.trim()){
      print('password does not match');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.confirmpass.value=true;
      controller.cnfpass.value=false;

      controller.cnfpass1.value=true;


      return false;
    }
    else if(controller.countrytxt.text.trim().isEmpty){
      print('country is empty');
      controller.confirmpass.value=false;
      controller.confirmemail.value=false;
      controller.confirmnumber.value=false;
      controller.passwordss.value=false;
      controller.cnfpass1.value=false;


      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.number.value=false;
      controller.number1.value=false;
      controller.address.value=false;
      controller.country.value=true;






      return false;
    }
    else if(controller.citytxt.text.trim().isEmpty){
      print('city is empty');
      controller.confirmpass.value=false;
      controller.confirmemail.value=false;
      controller.confirmnumber.value=false;
      controller.passwordss.value=false;
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.number.value=false;
      controller.number1.value=false;
      controller.address.value=false;
      controller.country.value=false;
      controller.city.value=true;






      return false;
    }
    else if(controller.phonetxt.text.trim().isEmpty){
      print('phone number is empty');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.confirmpass.value=false;
      controller.confirmnumber.value=true;
      controller.city.value=false;
      controller.number.value=true;





      return false;
    }

    else if(controller.phonetxt.text.trim().length<11){
      print('password does not match');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.number.value=false;
      controller.confirmnumber.value=true;

      controller.number1.value=true;




      return false;
    }

    else if(controller.addtxt.text.trim().isEmpty){
      print('address is empty');
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.number.value=false;
      controller.number1.value=false;
      controller.confirmpass.value=false;
      controller.confirmemail.value=false;
      controller.confirmnumber.value=false;
      controller.passwordss.value=false;
      controller.address.value=true;





      return false;
    }





    else{
      controller.confirmpass.value=false;
      controller.confirmemail.value=false;
      controller.confirmnumber.value=false;
      controller.passwordss.value=false;
      controller.name.value=false;
      controller.lname.value=false;
      controller.showTooltip.value=false;
      controller.email.value=false;
      controller.password.value=false;
      controller.password1.value=false;
      controller.number.value=false;
      controller.number1.value=false;
      controller.address.value=false;
      controller.country.value=false;
      controller.city.value=false;
      return true;

    }
  }

 print(phone) async {
   await print(phone);
}


  String checkingemail ='Phone number already exist';
  Future check(String phone) async{

    if(_validateUserData()){
     await controller.getdata(controller.fName.text.trim(), controller.lName.text.trim(), controller.emailtxt.text.trim(), controller.addtxt.text.trim(), controller.citytxt.text.trim(), controller.passtxt.text.trim(), controller.phonetxt.text.trim(),controller.countryCode.text.trim());

    }
    else{
      return null;
    }

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

)


{
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child: Container(
      height: 50,
      child: Stack(
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black),
                suffixIcon: icon
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
            child: val
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
            child: val1
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
    child: Container(
      height: 50,
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
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black),                suffixIcon: trueorfalse
                    ? Icon(
                  Icons.error,
                  color: Colors.red,
                )
                    : null,
              ),

              keyboardType: txt,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            //You can use your own custom tooltip widget over here in place of below Container
            child: trueorfalse
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
Padding countrycode(
    TextEditingController controller,
    String hint,

    TextInputType txt,


    ) {
  return Padding(
    padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
    child: Container(
      height: 50,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.4),
                ),
                hintStyle: TextStyle(color: Colors.black),
                labelText: hint,
                labelStyle:   TextStyle(color: Colors.black),
              ),

              keyboardType: txt,
            ),
          ),
        ],
      ),
    ),
  );}
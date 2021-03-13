import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.5,),
                  GetX<CustomValidator>(
                      initState: (_) {},
                      builder: (controller) {
                        return Column(
                          children: [
                            emailandpass(ValueKey('email'),
                                controller.loginemail,
                                controller.showTooltip.value,
                                controller.email.value,
                                controller.confirmemail.value,
                                'Email or Phone',
                                "Kindly Enter Your Mail.",
                                "Invalid Email.",
                                TextInputType.emailAddress,
                                false,
                                null),
                            emailandpass(ValueKey('pass'),
                                controller.loginpass,
                                controller.password.value,
                                controller.password1.value,
                                controller.passwordss.value,
                                'Password',
                                "Password is empty.",
                                "Password Length less than 6.",
                                null,
                                true,
                                null),
                            SizedBox(
                              height: Get.height * 0.06,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                check();
                              },
                              child: Text('Click Here'),
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
    );
  }



  Padding emailandpass(
      Key key,
      TextEditingController textEditingController,
      bool val,
      bool val1,
      bool icon,
      String hint,
      String text,
      String text1,
      TextInputType textinputtype,
      bool pass,
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
                key: key,
                controller: textEditingController,
                inputFormatters: inputFormatters,
                obscureText: pass,
                keyboardType: textinputtype,


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



  bool _validateUserData() {
     if(controller.emailtxt.text.trim().isEmpty){
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

     else{
       controller.showTooltip.value=false;
       controller.email.value=false;
       controller.password.value=false;
       controller.password1.value=false;
       controller.passwordss.value=false;
       controller.confirmemail.value=false;
      return true;



     }



  }

  void check(){
    if(_validateUserData()){

      controller.getlogindata(controller.loginemail.text.trim(), controller.loginpass.text.trim());
      print('Login Done');
    }
  }
}

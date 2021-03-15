import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';
import 'package:trollyproject/model/forgot.dart';

class Login extends StatelessWidget {
  CustomValidator controller = Get.put(CustomValidator());

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> _formKeys = GlobalKey();

  String emailAndPhone;
  String password;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
Forgot forgot = Forgot();

  @override
  Widget build(BuildContext context) {
    Orientation orientation =MediaQuery.of(context).orientation;

    return Scaffold(
      body: SafeArea(
        child: Container(
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


                              emailsandpass(controller.emailtxt,
                                  controller.showTooltip.value,controller.email.value,controller.confirmemail.value,
                                  'Email or Phone',
                                  "Please enter a valid email.",
                                  "Please enter a valid email.",
                                  TextInputType.emailAddress,false,  null,controller.emailNameFocus ,(term) {
                                    controller.emailNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.passNameFocus);
                                  },true ,TextInputAction.next),



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
                                  null,                                 controller.passNameFocus,
                                    (term) {
                                    controller.passNameFocus.unfocus();
                                    FocusScope.of(context).requestFocus(controller.submit);
                                  },TextInputAction.done,true,),


                              Padding(
                                padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(

                                      children: [
                                        Text('Language',style: TextStyle(color: Colors.black45),),
                                        SizedBox(height: 5,),
                                        Text('English'),
                                      ],
                                      crossAxisAlignment:CrossAxisAlignment.start,

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:14.0),
                                      child: FlatButton(onPressed: (){
                                        showsDialog(context,controller.resetPass);
                                      }, child: Text('Forgot Password?',style: TextStyle(color: Colors.black45),)),
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
      bottomNavigationBar:                               Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15,top: 8,bottom: 8),
        child: Container(
          width:Get.width,
          height: orientation==Orientation.portrait? Get.height*0.06:Get.height*0.123,
          child: ElevatedButton(
            focusNode: controller.submit,


            onPressed: ()  {
              check();
            },
            child: Text('Login'.toUpperCase()),
            style: ElevatedButton.styleFrom(
                primary: Colors.red
            ),
          ),
        ),
      ),
    );


  }
  bool showicon=false;

   showsDialog(BuildContext context,TextEditingController resetPass ){

    showDialog(
        context: context,
        builder: (context) {
          
          return  StatefulBuilder(
              builder: (context, setState){

              return AlertDialog(

                insetPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 150),

                title:Form(
                  key: _formKeys,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Forgot Password?',style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none),),
                      SizedBox(height: 6,),
                      Text('To reset your password, enter the email address you use to register.We will send code on email address.',style: TextStyle(fontSize: 15,color: Colors.black54.withOpacity(0.8),decoration: TextDecoration.none),
                        maxLines: 3,),

                      TextFormField(
                        controller:controller.resetPass,
                        decoration:showicon? InputDecoration( 
                          
                          hintText: 'Email',

                        suffixIcon:   showicon?Icon(Icons.error,color: Colors.red,): Container(),
                      ):InputDecoration(  hintText: 'Email',

                          //suffixIcon:   showicon?Icon(Icons.error,color: Colors.red,): Container(),
                        ),



                      ),
                    ],

                  ),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(


                      overlayColor:MaterialStateProperty.all(Colors.white),
                    ),
                    clipBehavior: Clip.none,
                    child: Text("Cancel".toUpperCase(),style: TextStyle(color: Colors.black),),
                    onPressed:  () {
                      Get.back();
                    },
                  ),
                  TextButton(
                      style: ButtonStyle(


                        overlayColor:MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text("Ok".toUpperCase(),style: TextStyle(color: Colors.black)),
                      onPressed:  () {
                        RegExp regex = new RegExp(pattern);
                        if(controller.resetPass.text.trim().isEmpty){
                          setState(() {
                            showicon =true;
                          });




                        }
                        else{
                          showicon=false;
                          // String fora=forgot.email;
                          // print('${fora} first');
                          // controller.resetPass.text =fora;
                          print('${controller.resetPass.text} second');

                          controller.passReset(controller.resetPass.text);


                          print(controller.resetPass.text.trim());
                        }
                      }),
                ],

              );
            }
          );
        }






    );

  }





  bool _validateiconata() {
    RegExp regex = new RegExp(pattern);
  if(controller.resetPass.text.trim().isEmpty){

    return false;


  }else{

    return true;
  }



  }
  checkform(){
    if(_validateiconata()){
      print('raja');
    }else{
      print('sdsjkdfhsdjk');


      return null;
    }
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
      List<TextInputFormatter> inputFormatters,
          FocusNode fnd,
      onFieldSubmitted,
      TextInputAction textInputAction,
      bool enabled
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
                focusNode: fnd,
                enabled: enabled,
                key: key,
                controller: textEditingController,
                inputFormatters: inputFormatters,
                obscureText: pass,
                keyboardType: textinputtype,


                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.4),
                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle:   TextStyle(color: Colors.black),

                  labelText: hint,
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
                  contentPadding: EdgeInsets.all(0),

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
}


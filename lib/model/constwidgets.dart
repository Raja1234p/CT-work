import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:image_picker/image_picker.dart';
import 'package:trollyproject/UI/reg.dart';


class ConstWidget {
  final controllers = Get.put(RegisterController());



  Widget sizedBox(double height) {
    return SizedBox(

      height: height,
    );
  }
  Widget sizedBoxW(double width) {
    return SizedBox(

      width: width,
    );
  }

//! Text Field FOrm
  Widget textFormField(String labelName, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: labelName,
          labelStyle: TextStyle(color: Colors.black)),
    );
  }

//! Text Field FOrm for Mobile Numberv
  Widget textFormFieldNumber(
      String hintName, TextEditingController controller,String  Function(String)error) {
    return TextFormField(
      validator:error ,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.4),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.4),
          ),

          hintStyle: TextStyle(color: Colors.black),
        hintText: hintName,),


    );
  }

  Widget row(String txt1, txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt1),
        Text(txt2),
      ],
    );
  }

//! Row Of check Box
  Widget rowCheckBox(String txt1, txt2, txt3) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Obx(
    //
    //           () => Checkbox(
    //
    //         //tristate: true,
    //         value: controller.ischecked.value,
    //         onChanged: (bool newValue) {
    //           controller.checked(newValue);
    //         },
    //         activeColor: red,
    //       ),
    //     ),
    //     Expanded(
    //       child: Wrap(
    //         children: [
    //           RichText(
    //             text: TextSpan(
    //                 text: txt1,
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                 ),
    //                 children: <TextSpan>[
    //                   textspan(txt2,black),
    //                   TextSpan(
    //                       text: ' and ',
    //                       style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 15,
    //                       )),
    //                   textspan(txt3,black),
    //                 ]),
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }

  TextSpan textspan(String txt,Color color) {
    return TextSpan(
      text: txt,
      style: TextStyle(
          color: color,
          fontSize: 15,
          decoration: TextDecoration.underline),
    );
  }

  Widget button(String txt, Color color, Function onPress) {
    return MaterialButton(
      onPressed: onPress,
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            txt,
            style: textStyle(Colors.white, 20),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle(Color color, double fontSize) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }

//! Circle Avatar Stack

  Widget circleAvatar(BuildContext context) {
    return


      CircleAvatar(
      child: ClipOval(
        child: Stack(
          children: <Widget>[
            Obx(()=>(controllers.pickedImage.value == '') ?
            Image.asset( 'assets/LoginImage/processed.jpeg')
                : Image.asset(controllers.pickedImage.value)),



            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 33,
              child: GestureDetector(
                onTap: () {
                  showsDialog(context, 'Choose Photo','Pick From Gallery', 'Take a picture',() {
                    controllers.loadPicker(ImageSource.gallery,context);
                  },() {
                    controllers.loadPicker(ImageSource.camera,context);
                  },);
                },
                child: Container(
                  height: 20,
                  width: 30,
                  color: Colors.black45,
                  child: Center(
                    child: Icon(Icons.photo_camera, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      radius: 68.0,
    );
  }

//! Snackbar

  snackBar(String title,msg) {
    Get.snackbar(title, msg,);
  }

//! Altert BOx

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.2,
          child: AlertDialog(
            title: new Text('Select Country'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(

                      () => ListTile(
                      title: Text('United Kingdom'),
                      leading: Text('+44'),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
            actions: <Widget>[],
          ),
        );
      },
    );
  }

//! Dialog Pop Up

  void showsDialog(BuildContext context, String title,txt1, txt2,Function txt1function,Function txt2function) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(txt1),
              onTap: txt1function,
            ),
            ListTile(
              title: Text(txt2),
              onTap: txt2function,
            )
          ],
        ),
      ),
    );
  }


//! Bottom Naviagtor

  //! Bottom Navigation End
  bottomNavigationItems(String name, IconData iconData){
    return BottomNavigationBarItem(

      label: name,
      icon: Icon(iconData,size: 40,),
    );
  }


//! AppBar Constant

  AppBar appbar(String title,bool center,IconData iconData,Color color,Function onTap){
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title,style: textStyle(Colors.black,18)),
      centerTitle: center,
      leading: GestureDetector(
          onTap: onTap,
          child: Icon(iconData,color: color,)),
    );
  }


//!HOmePage Image

  Widget imageContainer(String imagePath, double height,double width,String imagePathSmall,names,Function onTap){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Stack(
          children: [
            Image.network(imagePath,fit: BoxFit.fill,height: height,width: width,),
            Positioned(
                bottom: 0,

                child: Container(
                  width: width,
                  height: height*0.28,
                  color: Colors.black54,
                )
            ),
            Positioned(

                top: height*0.62,
                right: width*0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(imagePathSmall,),
                    Text(names,style: TextStyle(color: Colors.white,fontSize: 21),textAlign: TextAlign.center,)
                  ],
                ))

          ],
        ),

      ),
    );
  }

//! Divider
  Widget divider(Color color,double height, double width){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        // Vertical Divider

        width: 1,
        height: 40,
        color: color,
      ),
    );
  }

//! Constant Colors
  final Color red = Color(0xffD9281E);
  final Color black = Colors.black;
}
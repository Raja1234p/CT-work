import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/Network/network.dart';
import 'package:trollyproject/model/loginandsignup.dart';

class CustomValidator extends GetxController{

  RxBool showTooltip = false.obs;
  RxBool email = false.obs;

  RxBool password = false.obs;
  RxBool password1 = false.obs;

  RxBool name = false.obs;
  RxBool name1 = false.obs;

  RxBool cnfpass = false.obs;
  RxBool cnfpass1 = false.obs;

  RxBool lname = false.obs;
  RxBool lname1 = false.obs;

  RxBool country = false.obs;
  RxBool city = false.obs;

  RxBool number = false.obs;
  RxBool number1 = false.obs;

  RxBool address = false.obs;
  RxBool address1 = false.obs;


  Rx<Welcome> welcome =Welcome().obs;

  getdata(String name,String lastname,String email,String address,String city,String password,String phoneNumber) async{
    welcome= await Network().registeration(name,lastname,email,address,city,password,phoneNumber);
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


  }





}



class CustomsValidations extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey();
  CustomValidator controller = Get.put(CustomValidator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Form(
            key:_formKey ,
            child: Column(
              children: [

                Stack(
                alignment: Alignment.topRight,
                overflow: Overflow.visible,
                children: <Widget>[
                  Obx(()=>TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        suffixIcon:
                        controller.showTooltip.value? Icon(Icons.error, color: Colors.red,):null,



                        hintText: "Password"
                    ),
                    validator: (value) {

                      if(value.isEmpty) {

                          controller.showTooltip.value = true;

                        return "";
                      }
                      else{
                        return null;
                      }


                    },
                  )),
                Obx(()=>  Positioned(
                    top: 50,
                    right: 10,
                    //You can use your own custom tooltip widget over here in place of below Container
                    child: controller.showTooltip.value
                        ? Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all( color: Colors.red, width: 2.0 ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          "Your passwords must match and be 6 characters long.",
                        ),
                      ),
                    ) : Container(),
                  ))
                ],
              ),

                RaisedButton(
                  child: Text("Validate"),
                  onPressed: () {
                    if(_formKey.currentState.validate()){

                        controller.showTooltip.value=false;

                    }
                  },
                ),

              ],
            ),
          ),
        padding: EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 100
    ),));
  }
}





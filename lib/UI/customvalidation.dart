import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/customvalidatorcontroller.dart';





// class LoginAlternate extends StatelessWidget {
//   GlobalKey<FormState> _formKey = GlobalKey();
//   bool showTooltip = false;
//
//   CustomValidator controller = Get.put(CustomValidator());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: 100,
//             vertical: 100
//         ),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               Stack(
//                 alignment: Alignment.topRight,
//                 overflow: Overflow.visible,
//                 children: <Widget>[
//                   TextFormField(
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide.none
//                           ),
//                           suffixIcon:   Obx(()=>controller.showTooltip.value?
//                           Icon(Icons.error, color: Colors.red,):Container(),),
//
//
//
//                           hintText: "Password"
//                       ),
//                       validator: (value) {
//                         controller.emptyValue(value);
//
//                       return '';
//                       }
//
//
//                   ),
//                   Obx(() => Positioned(
//                     top: 50,
//                     right: 10,
//                     //You can use your own custom tooltip widget over here in place of below Container
//                     child: controller.showTooltip.value
//                         ? Container(
//                       width: 250,
//                       height: 50,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all( color: Colors.red, width: 2.0 ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child: Center(
//                         child: Text(
//                           "Your passwords must match and be 6 characters long.",
//                         ),
//                       ),
//                     ) : Container(),
//                   ))
//                 ],
//               ),
//               RaisedButton(
//                 child: Text("Validate"),
//                 onPressed: () {
//                   if(_formKey.currentState.validate()){
// print('done');                  }
//
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginAlternate extends StatefulWidget {
  @override
  _LoginAlternateState createState() => _LoginAlternateState();
}

class _LoginAlternateState extends State<LoginAlternate> {

  GlobalKey<FormState> _formKey = GlobalKey();
  bool showTooltip = false;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 100
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                overflow: Overflow.visible,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        suffixIcon:
                          showTooltip? Icon(Icons.error, color: Colors.red,):null,



                        hintText: "Password"
                    ),
                    validator: (value) {
                      if(value.isEmpty) {
                        setState(() {
                          showTooltip = true;
                        });
                        return "";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  Positioned(
                    top: 50,
                    right: 10,
                    //You can use your own custom tooltip widget over here in place of below Container
                    child: showTooltip
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
                  )
                ],
              ),
              RaisedButton(
                child: Text("Validate"),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    setState(() {
                      showTooltip=false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
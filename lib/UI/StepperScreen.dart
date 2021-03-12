import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/StepperController.dart';


class SteperScreen extends StatelessWidget {

  final controller = Get.put(SteperController());

  TextEditingController cancelOrderOther = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "MM Fresh Groceries",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Theme(
            data: ThemeData(
                accentColor: Colors.red,
                primarySwatch: Colors.red,
                colorScheme: ColorScheme.light(
                  primary: Colors.red,
                )
            ),
            child: Container(
              height: Get.height,
              child: Column(
                children: [
                  Text("Order Number # 55", style: TextStyle(color: Colors.black),),
                  GetX<SteperController>(
                      builder: (Buildcontext) {
                        return Expanded(
                          child: Stepper(
                            physics: NeverScrollableScrollPhysics(),
                            onStepContinue: controller.continued(),
                            onStepTapped: (step){
                              controller.tapped(step);

                            },
                            onStepCancel: controller.cancel(),
                            currentStep: controller.currentStep.value,
                            type: controller.stepperType.value,
                            steps: [
                              Step(
                                isActive: controller.currentStep.value >= 0,
                                state: controller.currentStep.value >= 0 ? StepState.complete : StepState.disabled,
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: FlatButton(
                                    onPressed: (){
                                      controller.switchSteps();
                                      cancelOrderDialogue(context, orientation);
                                    },
                                    color: Colors.grey[300],
                                    child: Text("Cancel Order", style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                                title: Text("Order accepted", style: TextStyle(color: Colors.black),),
                                content: Text(""),
                              ),
                              Step(
                                isActive: controller.currentStep.value >= 0,
                                state: controller.currentStep.value >= 1 ?
                                StepState.complete : StepState.disabled,
                                title: Text("Order prepared", style: TextStyle(color: Colors.black),),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: RaisedButton(
                                    onPressed: (){
                                      controller.switchSteps();
                                    },
                                    color: Colors.grey[300],
                                    child: Text("Order on the way", style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                                content: Text(""),
                              ),
                              Step(
                                  isActive: controller.currentStep.value >= 0,
                                  state: controller.currentStep.value >= 2 ?
                                  StepState.complete : StepState.disabled,
                                  content: Text(""),
                                  title: Text("Order receive", style: TextStyle(color: Colors.black),),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: RaisedButton(
                                      onPressed: (){
                                        controller.switchSteps();
                                        // Get.to(OrderPrepairedDetialScreen());
                                      },
                                      color: Colors.grey[300],
                                      child: Text("Track Order", style: TextStyle(color: Colors.black),),
                                    ),
                                  )
                              ),
                              Step(
                                  isActive: controller.currentStep.value >= 0,
                                  state: controller.currentStep.value >= 1 ?
                                  StepState.complete : StepState.disabled,
                                  content: Text(""),
                                  title: Text("Order accepted", style: TextStyle(color: Colors.black),),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: RaisedButton(
                                      onPressed: (){
                                        controller.switchSteps();
                                      },
                                      color: Colors.grey[300],
                                      child: Text("Complete", style: TextStyle(color: Colors.black),),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget cancelOrderDialogue(context, orientation) {
    showDialog(
        barrierDismissible: orientation == Orientation.portrait ? false : true,
        context: context,
        builder: (context) {
          return Padding(
            padding: orientation == Orientation.portrait ? const EdgeInsets.symmetric(vertical: 100) : const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              physics: orientation == Orientation.portrait ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              child: AlertDialog(
                title: Text('Cancel Order'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: controller.radioGroupValue.value,
                          onChanged: (value){
                            controller.setGroupValue(value);
                          },
                        ),
                        Expanded(child: const Text("Missing item from my order")),
                      ],
                    )),
                    Obx(() => Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: controller.radioGroupValue.value,
                          onChanged: (value){
                            controller.setGroupValue(value);
                          },
                        ),
                        Expanded(child: const Text("Delivery address is incorrect")),
                      ],
                    )),
                    Obx(() => Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 3,
                          groupValue: controller.radioGroupValue.value,
                          onChanged: (value){
                            controller.setGroupValue(value);
                          },
                        ),
                        Expanded(child: const Text("Others")),
                      ],
                    )),
                    Obx(() => Visibility(
                        visible: controller.isOtherFieldOpen.value,
                        child: primaryTextField(cancelOrderOther, "", "", TextInputType.text))),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: orientation == Orientation.portrait ? Get.width * 0.35 : Get.width * 0.2,
                        //height: orientation == Orientation.portrait ? Get.height * 0.03 : Get.height * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print(controller.radioGroupValue.value);
                                if(cancelOrderOther.text.isEmpty && controller.radioGroupValue.value == 3){
                                  print("cancel order toast here");
                                }
                                else{
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  Widget primaryTextField(TextEditingController inputController, placeholder,
      errorText, keyBoardType) {
    return Container(
      height: 40,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TextFormField(
          keyboardType: keyBoardType,
          controller: inputController,
          decoration: new InputDecoration(
              errorText: errorText,
              errorStyle: TextStyle(color: Colors.red),
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.black45),
              contentPadding: const EdgeInsets.only(bottom: 10, top: 5),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              focusedErrorBorder: new UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              )),
        ),
      ),
    );
  }
}

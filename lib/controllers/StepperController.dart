import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SteperController extends GetxController{

  Rx<StepperType> stepperType = StepperType.vertical.obs;

  var currentStep = 0.obs;
  var radioGroupValue = 0.obs;
  var isOtherFieldOpen = false.obs;

  void setGroupValue(index){
    radioGroupValue.value = index;
    if(radioGroupValue.value == 3){
      isOtherFieldOpen.value = true;
    }
    else{
      isOtherFieldOpen.value = false;
    }
    print(radioGroupValue.value);
    update();
  }



  switchSteps() {
    currentStep.value = currentStep.value == 2 ? 1: currentStep.value +1;
    update();
  }

  tapped(int step){
    currentStep.value = step;
  }

  continued(){
    currentStep.value < 2 ?
    currentStep.value += 1 : null;
  }
  cancel(){
    currentStep.value > 0 ?
    currentStep.value -= 1 : null;
  }
}

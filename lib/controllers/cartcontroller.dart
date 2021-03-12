import 'package:get/state_manager.dart';
import 'package:trollyproject/model/cartitems.dart';

class CartControllers  extends GetxController{
  var carts = List<CartIems>().obs;
  var name = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcartitem();
    change('Kumar');

  }
void change(name){
    name = name;
    update();
}
  void getcartitem() async{
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      CartIems('apple', 'this is an apple', 12),
      CartIems('orange', 'this is an orange', 13),
      CartIems('mango', 'this is a mango', 14),
    ];

    carts.assignAll(serverResponse);
  }
}

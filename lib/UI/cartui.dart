import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trollyproject/controllers/cartcontroller.dart';
import 'package:get/get.dart';

class Carts extends StatelessWidget {
  final cartController=  Get.put(CartControllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: GetX<CartControllers>(
            builder: (controller)=>
             ListView.builder(
                itemCount:controller.carts.length ,
                itemBuilder: (context,int index){
              return Container(
                height: 100,

                child: Card(
                  color: Colors.blue,
                  child: ListTile(
                    title: Obx(()=>Text(controller.name.value),),
                    subtitle: Text(controller.carts[index].description),
                    trailing: Text(cartController.carts[index].price.toString()),
                  ),
                ),
              );

            }),
          ))
        ],
      ),
    );
  }
}

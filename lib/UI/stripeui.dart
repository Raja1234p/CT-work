import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:get/get.dart';
import 'package:trollyproject/controllers/stripecontroller.dart';

import 'dart:io';
class Stripepayments extends StatelessWidget {
  var StripeControllers = Get.put(StripeController());



  ScrollController _controller = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: new AppBar(
        title: new Text('Stripe Payment Demo',),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
             StripeControllers.clear();
            },
          )
        ],
      ),
      body: ListView(
        controller: _controller,
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          RaisedButton(
            child: Text("Create Source"),
            onPressed: () {
              StripeControllers.params();
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Token with Card Form"),
            onPressed: () {
             StripeControllers.paymentRequest();
            },
          ),
          RaisedButton(
            child: Text("Create Token with Card"),
            onPressed: () {
StripeControllers.createToken();
            },
          ),
          Divider(),
          RaisedButton(
            child: Text("Create Payment Method with Card"),
            onPressed: () {
             StripeControllers.paymentMethodWithCard();
            },
          ),
          RaisedButton(
            child: Text("Create Payment Method with existing token"),
            onPressed: (){
              StripeControllers.createPaymentMethodWithExistingToken();
    }

          ),
          Divider(),
          RaisedButton(
            child: Text("Confirm Payment Intent"),
            onPressed: (){
              StripeControllers.confirmPaymentIntent();
    }


          ),
          RaisedButton(
            child: Text("Authenticate Payment Intent"),
            onPressed:(){
              StripeControllers.authenticatePaymentIntent();
  }

          ),
          Divider(),
          RaisedButton(
            child: Text("Native payment"),
            onPressed: () {
              if (Platform.isIOS) {
                _controller.jumpTo(450);
              }
              StripeControllers.nativePayment();
            },
          ),
          RaisedButton(
            child: Text("Complete Native Payment"),
            onPressed: () {
StripeControllers.completeNativePayment();
            },
          ),
          Divider(),
          Text('Current source:'),
          Text(
            JsonEncoder.withIndent('  ').convert(StripeControllers.source?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current token:'),
          Text(
            JsonEncoder.withIndent('  ').convert(StripeControllers.paymentToken?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment method:'),
          Text(
            JsonEncoder.withIndent('  ').convert(StripeControllers.paymentMethod?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current payment intent:'),
          Text(
            JsonEncoder.withIndent('  ').convert(StripeControllers.paymentIntent?.toJson() ?? {}),
            style: TextStyle(fontFamily: "Monospace"),
          ),
          Divider(),
          Text('Current error: $StripeControllers.error'),
        ],
      ),
    );
}}

import 'package:craftsman/app/modules/home/controllers/cart_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetView<CartController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('CartPage')),

    body:Container(color: Colors.red.shade50,)
    );
  }
}
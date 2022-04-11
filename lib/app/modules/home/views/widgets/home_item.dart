
import 'package:craftsman/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


import '../cart_view.dart';
import '../home_view.dart';
import '../mine_view.dart';

class HomeItem extends StatelessWidget {
  final String? title;
  final Widget? icon;
  // final Rx<BottomTab> tab;
  HomeItem({
    Key? key,
    this.icon,
    this.title,
    // required this.tab,
  }) : super(key: key);

  final logic = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            if (logic.tab.value == BottomTab.home) {
              Get.offAll(HomeView());
            } else if (logic.tab.value == BottomTab.cart) {
              Get.offAll(CartView());
            } else {
              Get.offAll(MineView());
            }
          },
          child: Column(
            children: [
              icon ?? Text(""),
              Text(title ?? ""),
              // Icon(Icons.home_outlined),
              // Text(
              //   "商城",
              //   style: TextStyle(
              //       fontSize: 11, fontFamily: "PingfangSC", color: Color(0xFF3F6BF8)),
              // ),
            ],
          ),
        );
  }
}

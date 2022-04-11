
import 'package:craftsman/app/modules/home/controllers/tabbar_view_controller.dart';
import 'package:craftsman/app/modules/home/views/cart_view.dart';
import 'package:craftsman/app/modules/home/views/home_view.dart';
import 'package:craftsman/app/modules/home/views/mine_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class TabbarView extends GetView<TabbarViewController> {
  TabbarView({Key? key}) : super(key: key);

  final tabbarLogic = Get.put(TabbarViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => contentWidget()),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (value) => onTabTapped(value),
              currentIndex: tabbarLogic.currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "商城"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: "购物车"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "我的"),
              ])),
    );
  }

  void onTabTapped(int index) {
    tabbarLogic.currentIndex.value = index;
  }

  Widget contentWidget() {
    if (tabbarLogic.currentIndex.value == 0) {
      return HomeView();
    } else if (tabbarLogic.currentIndex.value == 1) {
      return CartView();
    } else {
      return MineView();
    }
  }
}

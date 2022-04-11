import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomTab { home, cart, mine }

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  final Rx<BottomTab> tab = BottomTab.home.obs;
  final currentIndex = 0.obs;

  final TextEditingController controller = TextEditingController();

  final items = [
    "综合",
    "裤子",
    "衣服",
    "夹克",
    "卫衣",
    "短袖",
    "内裤",
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  
}

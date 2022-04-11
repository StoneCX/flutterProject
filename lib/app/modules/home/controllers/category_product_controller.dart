import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class CategoryProductController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  bool multiple = true;
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

// final MyRepository repository;
  CategoryProductController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}

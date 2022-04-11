import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoginGateWay { code, password }

class LoginController extends GetxController {
  final count = 0.obs;
  final Rx<LoginGateWay> loginGate = LoginGateWay.code.obs;

  final TextEditingController controller = TextEditingController();
  RxBool getVerifyCode = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

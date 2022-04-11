import 'package:get/get.dart';

class CartController extends GetxController {

// final MyRepository repository;
  CartController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
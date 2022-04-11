import 'package:get/get.dart';

class MineController extends GetxController {

// final MyRepository repository;
  MineController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
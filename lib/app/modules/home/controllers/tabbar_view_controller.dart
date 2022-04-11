import 'package:get/get.dart';

class TabbarViewController extends GetxController {
  final currentIndex = 0.obs;
// final MyRepository repository;
  TabbarViewController();

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}

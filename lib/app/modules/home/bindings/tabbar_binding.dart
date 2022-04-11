

import 'package:craftsman/app/modules/home/controllers/tabbar_view_controller.dart';
import 'package:get/get.dart';



class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarViewController>(
      () => TabbarViewController(),
    );
  }
}

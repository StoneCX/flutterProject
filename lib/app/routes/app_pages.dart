import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/login_binding.dart';
import '../modules/home/bindings/tabbar_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/login_view.dart';
import '../modules/home/views/tabbar_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const kInitial = Routes.kHome;
  static const kLogin = Routes.kLogin;
  static const kNavigation = Routes.kNavigation;

  static final routes = [
    GetPage(
      name: _Paths.kHome,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.kLogin,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.kNavigation,
      page: () => TabbarView(),
      binding: TabbarBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
  ];
}

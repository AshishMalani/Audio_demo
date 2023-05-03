import 'package:get/get.dart';

import '../modules/PracticesScreen/bindings/practices_screen_binding.dart';
import '../modules/PracticesScreen/views/practices_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRACTICES_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRACTICES_SCREEN,
      page: () => const PracticesScreenView(),
      binding: PracticesScreenBinding(),
    ),
  ];
}

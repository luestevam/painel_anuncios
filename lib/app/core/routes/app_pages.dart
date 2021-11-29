import 'package:flutter_web/app/presenter/home/home.dart';
import 'package:flutter_web/app/presenter/home/home_binding.dart';
import 'package:flutter_web/app/presenter/sign_in/sing_in_binding.dart';
import 'package:flutter_web/app/presenter/sign_in/signIn_page.dart';



import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => SignInPage(),
      binding: SingInBinding(),
    ),
  ];
}

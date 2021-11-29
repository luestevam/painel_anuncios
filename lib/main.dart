import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/core/routes/app_pages.dart';
import 'app/core/themes/theme_color.dart';
import 'app/infra/gateways/shared_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ThemesColor.primaryColorGreen,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      initialRoute: AppPages.INITIAL,
      initialBinding: SharedServices(),
      getPages: AppPages.routes,
    );
  }
}

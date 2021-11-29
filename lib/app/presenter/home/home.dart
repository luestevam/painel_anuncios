import 'package:flutter/material.dart';
import 'package:flutter_web/app/presenter/components/footer.dart';
import 'package:flutter_web/app/presenter/components/header.dart';
import 'package:flutter_web/app/presenter/components/side_menu.dart';

import 'package:get/get.dart';

import 'components/responsive.dart';
import './home_controller.dart';

class HomeScreen extends GetResponsiveView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            constraints: BoxConstraints(minHeight: size.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Header(), Jumbotron(), Footer()],
            ),
          ),
        ),
      ),
    );
  }
}

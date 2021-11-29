import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/routes/app_routes.dart';
import 'package:get/get.dart';

import 'menu_item.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              NavItem(
                title: 'Home',
                tapEvent: () {},
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Get.toNamed(Routes.LOGIN)              
                ,
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              NavItem(
                title: 'Conheça-nos',
                tapEvent: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

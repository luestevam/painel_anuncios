import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/routes/app_routes.dart';

import 'package:flutter_web/responsive.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/logo3.png',
            width: 50,
          ),
          SizedBox(width: 10),
          Text(
            "Rede Anúncio",
            style: GoogleFonts.reenieBeanie(fontSize: 22),
          ),
          Spacer(),
          if (!isMobile(context))
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Inicio'),
                ),
                TextButton(
                  onPressed: ()=> Get.toNamed(Routes.LOGIN),
                    ///!!! IMPORTANTE !!! Mudar isso apra uma interface 
                   
        
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Nosso Parceiros'),
                ),
              ],
            ),
          if (isMobile(context))
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                })
        ],
      ),
    );
  }
}

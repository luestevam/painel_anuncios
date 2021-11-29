import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/themes/theme_color.dart';


class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.title,
    required this.tapEvent
  }) : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            color: ThemesColor.textColorBlack,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}
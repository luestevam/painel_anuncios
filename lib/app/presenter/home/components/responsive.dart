import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/themes/theme_color.dart';
import 'package:flutter_web/app/presenter/components/main_button.dart';
import 'package:flutter_web/responsive.dart';


class Jumbotron extends StatelessWidget {
  const Jumbotron({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
                child: Column(
                  mainAxisAlignment: !isMobile(context)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: !isMobile(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: <Widget>[
                    if (isMobile(context))
                      Image.asset(
                        'assets/images/carrossel01.gif',
                        height: size.height * 0.3,
                      ),
                    RichText(text: TextSpan(children: [])),
                    Text(
                      'Anúncie sua marca',
                      style: TextStyle(
                          fontSize: isDesktop(context) ? 64 : 32,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Cresça com a gente!',
                      style: TextStyle(
                        fontSize: isDesktop(context) ? 54 : 27,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Anuncie sua empresa no nosso APP.',
                      textAlign: isMobile(context)
                          ? TextAlign.center
                          : TextAlign.start,
                      style: TextStyle(
                          fontSize: isDesktop(context) ? 36 : 18,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      runSpacing: 10,
                      children: <Widget>[
                        MainButton(
                          title: 'Solicite um orçamento',
                          color: ThemesColor.primaryColorGreen,
                          tapEvent: () {},
                        ),
                        SizedBox(width: 10),
                        MainButton(
                          title: 'Fale Conosco',
                          color: ThemesColor.secondaryColorYallow,
                          tapEvent: () {},
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              ),
            ),
            if (isDesktop(context) || isTab(context))
              Expanded(
                child: Image.asset(
                  'assets/images/carrossel01.gif',
                  height: size.height * 0.7,
                ),
              ),
          ],
        ));
  }
}

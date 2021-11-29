import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/themes/theme_color.dart';
import 'package:flutter_web/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? DesktopFooter() : MobileFooter();
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () async {
                    const url =
                        'https://www.facebook.com/rfraterna/?ref=page_internal';
                    if (await canLaunch(url)) {
                    } else {
                      throw 'Could not Launcher $url';
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.facebookSquare,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    const url = 'https://www.instagram.com/redefraterna/';
                    if (await canLaunch(url)) {
                    } else {
                      throw 'Could not Launcher $url';
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.instagramSquare,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    const url = 'https://pt-br.facebook.com/';
                    if (await canLaunch(url)) {
                    } else {
                      throw 'Could not Launcher $url';
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.whatsappSquare,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  const url =
                      'https://www.facebook.com/rfraterna/?ref=page_internal';
                  if (await canLaunch(url)) {
                  } else {
                    throw 'Could not Launcher $url';
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.facebookSquare,
                  size: 30,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                onPressed: () async {
                  const url = 'https://www.instagram.com/redefraterna/';
                  if (await canLaunch(url)) {
                  } else {
                    throw 'Could not Launcher $url';
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.instagramSquare,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () async {
                  const url = 'https://pt-br.facebook.com/';
                  if (await canLaunch(url)) {
                  } else {
                    throw 'Could not Launcher $url';
                  }
                },
                icon: Icon(
                  FontAwesomeIcons.whatsappSquare,
                  size: 30,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.title, required this.tapEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: TextStyle(color: ThemesColor.primaryColorGreen, fontSize: 12),
        ),
      ),
    );
  }
}

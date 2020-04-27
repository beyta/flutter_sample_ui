import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconMapping {
  IconMapping(String string, {this.iconData});

  final String iconData;

  IconData getIconForName(String iconData) {
    switch (iconData) {
      case 'facebook':
        {
          return FontAwesomeIcons.facebook;
        }
        break;

      case 'twitter':
        {
          return FontAwesomeIcons.twitter;
        }
        break;

      default:
        {
          return FontAwesomeIcons.home;
        }
    }
  }

//  Map<String, IconData> iconMapping = {
//    'fa-users' : FontAwesomeIcons.users,
//    'fa-newspaper-o' : FontAwesomeIcons.newspaper,
//    'fa-calculator' : FontAwesomeIcons.calculator,
//    'fa-clock-o' : FontAwesomeIcons.clock,
//    'fa-money' : FontAwesomeIcons.moneyCheck,
//  };
}

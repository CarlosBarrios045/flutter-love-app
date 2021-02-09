import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final Color color;

  CustomAppBar({this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: color ?? Colors.white.withOpacity(0.4),
                  )),
              /* Spacer(),
              FaIcon(FontAwesomeIcons.headphonesAlt),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.externalLinkAlt), */
            ],
          )),
    );
  }
}

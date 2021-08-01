import 'package:flutter/material.dart';
import 'package:the_social/constants/Constantcolors.dart';

class Profile extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: constantColors.blueGreyColor.withOpacity(0.4),
          title: RichText(
            text: TextSpan(
                text: 'My ',
                style: TextStyle(
                  color: constantColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Profile',
                    style: TextStyle(
                      color: constantColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  )
                ]),
          )),
    );
  }
}

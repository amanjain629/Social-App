import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:the_social/constants/Constantcolors.dart';
import 'package:the_social/screens/Homepage/Homepage.dart';
import 'package:the_social/screens/LandingPage/landingServices.dart';
import 'package:the_social/services/Authentication.dart';

class LandingHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login.png'))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
      top: 500.0,
      left: 10.0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 170.0,
        ),
        child: RichText(
          text: TextSpan(
              text: 'Are ',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: constantColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
              children: <TextSpan>[
                TextSpan(
                    text: 'You ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0)),
                TextSpan(
                    text: 'Social ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: constantColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0)),
                TextSpan(
                    text: '?',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0))
              ]),
        ),
      ),
    );
  }

  Widget mainButton(BuildContext context) {
    return Positioned(
      top: 680.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                emailAuthSheet(context);
              },
              //Button is clickable by using this
              child: Container(
                child: Icon(EvaIcons.emailOutline,
                    color: constantColors.yellowColor),
                width: 80.0,
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.yellowColor),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            GestureDetector(
              // Button is clickable by using this
              onTap: () {
                print('Signin with google');
                Provider.of<Authentication>(context, listen: false)
                    .signInWithGoogle()
                    .whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: Homepage(),
                          type: PageTransitionType.leftToRight));
                });
              },
              child: Container(
                child: Icon(FontAwesomeIcons.google,
                    color: constantColors.blueColor),
                width: 80.0,
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.blueColor),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            GestureDetector(
              //Button is clickable by using this
              child: Container(
                child: Icon(FontAwesomeIcons.facebookF,
                    color: constantColors.redColor),
                width: 80.0,
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(color: constantColors.redColor),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget privacyText(BuildContext context) {
    return Positioned(
      top: 750.0,
      left: 20.0,
      right: 20.0,
      child: Container(
        child: Column(
          children: [
            Text("By continuing you agree theSocial's Terms of",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0)),
            Text("Services & Privacy Policy",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0))
          ],
        ),
      ),
    );
  }

  emailAuthSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: constantColors.blueColor,
                        child: Text('Log In',
                            style: TextStyle(
                                color: constantColors.whiteColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingServices>(context, listen: false)
                              .logInSheet(context);
                        }),
                    MaterialButton(
                        color: constantColors.redColor,
                        child: Text('Sign In',
                            style: TextStyle(
                                color: constantColors.whiteColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Provider.of<LandingServices>(context, listen: false)
                              .signInSheet(context);
                        })
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
          );
        });
  }
}

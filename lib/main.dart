import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_social/constants/Constantcolors.dart';
import 'package:the_social/screens/Homepage/HomepageHelpers.dart';
import 'package:the_social/screens/LandingPage/landingHelpers.dart';
import 'package:the_social/screens/LandingPage/landingServices.dart';
import 'package:the_social/screens/Splashscreen/splashScreen.dart';
import 'package:the_social/services/Authentication.dart';
import 'package:the_social/services/FirebaseOperations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
        child: MaterialApp(
          home: Splashscreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              accentColor: constantColors.blueColor,
              fontFamily: 'Poppins',
              canvasColor: Colors.transparent),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => Authentication()),
          ChangeNotifierProvider(create: (_) => LandingHelpers()),
          ChangeNotifierProvider(create: (_) => LandingServices()),
          ChangeNotifierProvider(create: (_) => HomepageHelpers()),
          ChangeNotifierProvider(create: (_) => FirebaseOperations()),
        ]);
  }
}

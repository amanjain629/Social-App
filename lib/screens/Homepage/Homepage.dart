import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_social/constants/Constantcolors.dart';
import 'package:the_social/screens/Chatroom/Chatroom.dart';
import 'package:the_social/screens/Feed/Feed.dart';
import 'package:the_social/screens/Homepage/HomepageHelpers.dart';
import 'package:the_social/screens/Profile/Profile.dart';
import 'package:the_social/services/FirebaseOperations.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ConstantColors constantColors = ConstantColors();
  final PageController homepageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<FirebaseOperations>(context, listen: false)
        .initUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: homepageController,
        children: [Feed(), Chatroom(), Profile()],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: Provider.of<HomepageHelpers>(context, listen: false)
          .bottomNavBar(context ,pageIndex, homepageController),
    );
  }
}

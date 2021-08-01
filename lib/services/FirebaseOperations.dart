
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_social/services/Authentication.dart';

class FirebaseOperations with ChangeNotifier {
  late String initUserEmail, initUserName;

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }

  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .get()
        .then((doc) {
      print('Fetching user data');
      initUserName = doc.data()?['username'] ?? 'Name'; 
      initUserEmail = doc.data()?['useremail'] ?? 'Email';
      print(initUserName);
      print(initUserEmail);
      notifyListeners();
    });
  }
}

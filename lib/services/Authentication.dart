import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late String userUid;
  String get getUserUid => userUid;

  Future logIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    userUid = user!.uid;
    print(userUid);
    notifyListeners();
  }

  Future createAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    userUid = user!.uid;
    print('Created account uid => $userUid');
    notifyListeners();
  }

  Future logOutViaEmail(){
    return firebaseAuth.signOut();
  }

  Future signInWithGoogle() async{
    final googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );

    final UserCredential userCredential = await firebaseAuth.signInWithCredential(
      authCredential
    );
    final User? user = userCredential.user;
    // ignore: unnecessary_null_comparison
    assert(user!.uid != null);

    userUid = user!.uid;
    print('Google User Uid => $userUid');
    notifyListeners();
  }

   Future signOutWithGoogle() async{
     return googleSignIn.signOut();
   }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:the_social/screens/LandingPage/landingPage.dart';

// class Authentication with ChangeNotifier {
//   Future<User?> createAccount(String name, String email, String password) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;

//     FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     try {
//       User? user = (await _auth.createUserWithEmailAndPassword(
//               email: email, password: password))
//           .user;

//       if (user != null) {
//         print("Account created Succesfull");

//         // ignore: deprecated_member_use
//         user.updateProfile(displayName: name);

//         await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
//           "name": name,
//           "email": email,
//           "status": "Unavalible",
//           "uid": _auth.currentUser!.uid,
//         });

//         return user;
//       } else {
//         print("Account creation failed");
//         return user;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   Future<User?> logIntoAccount(String email, String password) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     try {
//       User? user = (await _auth.signInWithEmailAndPassword(
//               email: email, password: password))
//           .user;

//       if (user != null) {
//         print("Login Sucessfull");
//         _firestore
//             .collection('users')
//             .doc(_auth.currentUser!.uid)
//             .get()
//             // ignore: deprecated_member_use
//             .then((value) => user.updateProfile(displayName: value['name']));

//         return user;
//       } else {
//         print("Login Failed");
//         return user;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   Future logOut(BuildContext context) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;

//     try {
//       await _auth.signOut().then((value) {
//         Navigator.push(context, MaterialPageRoute(builder: (_) => Landingpage()));
//       });
//     } catch (e) {
//       print("error");
//     }
//   }
// }
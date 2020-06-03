import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //Handles Auth
//  handleAuth() {
//    return StreamBuilder(
//        stream: FirebaseAuth.instance.onAuthStateChanged,
//        builder: (BuildContext context, snapshot) {
//          if (snapshot.hasData) {
//            return DashboardPage();
//          } else {
//            return LoginPage();
//          }
//        });
//  }

  //Sign out
  signOut() {

    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    try{

    FirebaseAuth.instance.signInWithCredential(authCreds);
    }catch(e){
      debugPrint("Exception at SignIn:-> $e");
    FirebaseAuth.instance.signInWithCredential(authCreds);

    }
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds;
    try{
       authCreds = PhoneAuthProvider.getCredential(
          verificationId: verId, smsCode: smsCode);
      debugPrint("Auth creds:> $authCreds");
      signIn(authCreds);

    }catch(e){
      debugPrint("Exception at:-> $e");
      signIn(authCreds);
    }
//    AuthCredential authCreds = PhoneAuthProvider.getCredential(
//        verificationId: verId, smsCode: smsCode);
//    debugPrint("Auth creds:> $authCreds");
//    signIn(authCreds);
  }
}
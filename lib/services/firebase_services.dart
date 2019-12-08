import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future<dynamic> verifyPhoneNumber(
      {String phoneNumber}) async {
    Completer completer= Completer();
    String verificationId;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) {
        print('Auth CRED - ${authCredential}  ${verificationId}');
        completer.complete(verificationId);
      },
      verificationFailed: (AuthException authException) {
        print('Auth FAILED WITH EXPEPTION CODE ${authException.code}- ${authException.message}');
        completer.complete(null);
      },
      codeSent: (String verifyId, [int forceResendingToken]) {
        verificationId = verifyId;
        print("code sent to " + phoneNumber + " Verification id ${verificationId}");
      },
      codeAutoRetrievalTimeout: (String verifyId) {
        verificationId = verifyId;
        print("time out");
      },
    );
    return completer.future;
  }

  authSignInUsingPhoneNumber({String smsOtp, String verificationId}) async {
    final AuthCredential authCredential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsOtp,
    );
    final AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    print('AUTH CRED - ${authResult.user.phoneNumber} ${authResult.user.uid}');
    await FirebaseAuth.instance.signOut();
  }
}

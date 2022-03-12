import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/myhome.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    user!.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      CheckEmailVerify();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('An Email Has Been Send To ${user!.email} For Verification'),
    ));
  }

  Future<void> CheckEmailVerify() async {
    await user!.reload();
    if (user!.emailVerified) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MyHome()));
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/auth_controller.dart';
import 'package:getx_firebase/configuration.dart';
import 'package:getx_firebase/signin.dart';

import 'home.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Configuration().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Configuration.screenWidth! * 0.05),
                child: FirebaseAuth.instance.currentUser != null ||
                        _.isSignedIn == true
                    ? Home()
                    : SignIn()),
          );
        },
      ),
    );
  }
}

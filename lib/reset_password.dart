import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/auth_controller.dart';
import 'package:getx_firebase/configuration.dart';
import 'package:getx_firebase/main.dart';
import 'package:getx_firebase/rounded_elevated_button.dart';
import 'package:getx_firebase/rounded_text_formfield.dart';

class ResetPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  final _authController = Get.find<AuthController>();

  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Configuration.screenWidth! * 0.04),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'If you want to recover your account, then please provide your email ID below...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: Configuration.screenHeight! * 0.05),
                  Image.asset(
                    "assets/forgetpass.png",
                    width: 350.0,
                  ),
                  SizedBox(height: Configuration.screenHeight! * 0.05),
                  RoundedTextFormField(
                    controller: _emailController,
                    hintText: "Email",
                    validator: (value) {
                      bool _isEmailValid =
                          RegExp(regExpression).hasMatch(value!);
                      if (!_isEmailValid) {
                        return 'Invalid email.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Configuration.screenHeight! * 0.05),
                  RoundedElevatedButton(
                    title: 'Send Link',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authController
                            .resetPassword(_emailController.text.trim());
                      }
                    },
                    padding: EdgeInsets.symmetric(
                      horizontal: Configuration.screenWidth! * 0.32,
                      vertical: Configuration.screenHeight! * 0.02,
                    ),
                  ),
                  SizedBox(height: Configuration.screenHeight! * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, use_build_context_synchronously, unnecessary_null_comparison, import_of_legacy_library_into_null_safe

import 'package:flash_chat/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/rounded_button.dart';
import 'chat_screen.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../services/alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'login_Screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // body: ModalProgressHUD(
        //   inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: inputStyle.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    inputStyle.copyWith(hintText: 'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final credential = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    print(credential);

                    if (credential != null) {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                    if (e.code == 'user-not-found') {
                      await showAlertDialog(
                          context: context,
                          titleText: 'Error',
                          messageText: 'No user found for that email');
                    } else if (e.code == 'wrong-password') {
                      await showAlertDialog(
                          context: context,
                          titleText: 'Error',
                          messageText: 'Wrong password provided for that user');
                    } else if (e.code == 'too-many-requests') {
                      await showAlertDialog(
                          context: context,
                          titleText: 'Error',
                          messageText: 'Too many attempts. Try again later');
                    }
                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                title: 'Log In',
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

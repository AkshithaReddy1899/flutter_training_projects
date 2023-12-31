// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
         bodyText1 : TextStyle(color: Colors.black54),
        ),
      ),*/
      initialRoute: 'welcome_screen',
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => const LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ChatScreen.id : (context) => const ChatScreen(),
      }
    );
  }
}

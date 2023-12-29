// ignore_for_file: await_only_futures, avoid_print

import 'package:flutter/material.dart';
import 'package:flash_chat/services/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/messages_stream.dart';
import '../components/color_contianer.dart';

User? loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  final messageTextController = TextEditingController();
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(
              loggedInUser: loggedInUser,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ColorContianer(
                    pickedColor: Colors.red,
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.red;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ColorContianer(
                    pickedColor: Colors.green,
                    onTap: () {
                      setState(() {
                        selectedColor = Colors.green;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      style: TextStyle(
                          color: (selectedColor == null)
                              ? Colors.grey
                              : selectedColor),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser?.email,
                        'textColor': (selectedColor == null)
                              ? convertToInt(Colors.grey)
                              : convertToInt(selectedColor!),
                        'timestamp': DateTime.now(),
                      });
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

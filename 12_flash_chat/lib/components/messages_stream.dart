import 'package:flash_chat/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/message_bubble.dart';

class MessagesStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  MessagesStream({super.key, required this.loggedInUser});

  final User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final messages = snapshot.data?.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages!) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            final currentUser = loggedInUser?.email;
            Color color =
                convertToColor(int.parse(message['textColor'].toString()));
            final messageColor = color;
            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              messageColor: messageColor,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}

/**import 'package:flash_chat/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/message_bubble.dart';

class MessagesStream extends StatefulWidget {

  MessagesStream({super.key, required this.loggedInUser});

  final User? loggedInUser;

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  final _firestore = FirebaseFirestore.instance;


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {

          final messages = snapshot.data?.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages!) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            final currentUser = widget.loggedInUser?.email;
            Color color =
                convertToColor(int.parse(message['textColor'].toString()));
            final messageColor = color;
            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              messageColor: messageColor,
              isMe: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);

          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
 */
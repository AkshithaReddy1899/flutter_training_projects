import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
   MessageBubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.messageColor,
      required this.isMe});

  final String sender;
  final String text;
  final Color messageColor;
  final bool isMe;

  Color? textColor;

  Color? pickTextColor() {

    if (messageColor != const Color(0xff9e9e9e)) {
      textColor = messageColor;
    } else {
      if (isMe == true) {
        textColor = Colors.white;
      }else {
        textColor = Colors.black;
      }
    }
    return textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
            ),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: pickTextColor(),
                  //color: isMe? textColor: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

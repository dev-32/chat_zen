import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.username,
    required this.message,
    required this.isMe,
}) : isFirstInSequence = true;

  const MessageBubble.second({
    super.key,
    required this.message,
    required this.isMe,
}) : isFirstInSequence = false, username = null;

  final bool isFirstInSequence;
  final String? username;
  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if( isFirstInSequence) const SizedBox(height: 18,),
                  if(username != null)
                    Padding(
                      padding: const EdgeInsets.only(left:13,right: 13),
                      child: Text(
                        username!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: BoxConstraints(maxWidth: 200),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    margin: EdgeInsets.symmetric(
                      vertical: 4,horizontal: 12
                    ),
                    child: Text(message,
                    style: TextStyle(
                      height: 1.3,
                    ),
                    softWrap: true,),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

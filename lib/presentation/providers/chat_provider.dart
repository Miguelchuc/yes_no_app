import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola mi buen amigo", fromWho: FromWho.me),
    Message(text: "Ya no puedes salir de aqui sorry", fromWho: FromWho.me)
  ];
}

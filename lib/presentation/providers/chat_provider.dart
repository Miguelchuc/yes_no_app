import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola mi buen amigo", fromWho: FromWho.me),
    Message(text: "Que dicen chat lo sacamos o no", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Flutter cantidad de mensajes : ${messageList.length}');

    //notifica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }

  //mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    //Animacio
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //offset posicion del maximo scroll posible
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //rebote de la animacion
        curve: Curves.easeOut);
  }
}

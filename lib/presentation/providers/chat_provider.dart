import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no-answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    //detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

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

  //crear la respuesta de ella
  Future<void> herReply() async {
    //ontener el mensaje de la peticion http
    final herMessage = await getYesNoAnswer.getAnswer();

    //añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    //notificar a provider los cambios
    notifyListeners();

    //mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}

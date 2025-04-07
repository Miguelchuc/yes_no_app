import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/Widgets/chat/him_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/Chat_Provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://static.myfigurecollection.net/upload/items/1/2429499-6e943.jpg'),
          ),
        ),
        title: Text('mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //le pide que este pendiente de cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HimMessageBubble()
                          : const MyMessageBubble();
                    })),
            //caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}

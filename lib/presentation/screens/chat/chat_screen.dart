import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cucp_yes_no_app/domain/entities/message.dart';
import 'package:cucp_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:cucp_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:cucp_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:cucp_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://ih1.redbubble.net/image.3243146287.5733/gsss,extra_large,product_square,1000x1000.jpg"),
          ),
        ),
        title: const Text('Usuario'),
        centerTitle: false
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final chatProvider = context.watch<ChatProvider>();
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  switch(message.fromWho){
                    case FromWho.me:
                      return MyMessage(message: message,);
                    case FromWho.her:
                      return HerMessage(message: message);
                  }
                },
                dragStartBehavior: DragStartBehavior.down
                )
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage
            )
          ],
        ),
      ),
    );
  }
}
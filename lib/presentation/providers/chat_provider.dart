import 'package:flutter/material.dart';
import 'package:cucp_yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:cucp_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  ScrollController chatScrollController = new ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> _messages = [
    Message(text: "Hola", fromWho: FromWho.me),
    Message(text: "Holaa", fromWho: FromWho.her),
    ];

  Future<void> sendMessage(String value) async {
    if(value.trim().isEmpty) return;
    final newMessage = Message(text: value, fromWho: FromWho.me);

    messages.add(newMessage);
    
    if(value.trim().endsWith("?")){
      herMessage();
    }

    notifyListeners();  
    await moveScrollToBottom();
  }

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herMessage() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messages.add(herMessage);
    notifyListeners();
    await moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    print("Scroll bottom");
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut);
  }
}
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focus = FocusNode();

    final outLineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje que termine en una "?"',
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          onValue(textController.value.text);
          textController.clear();
          focus.requestFocus();
        },
      )
    );

    return TextFormField(
      focusNode: focus,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focus.requestFocus();
      },
      onTapOutside: (event) {
        focus.unfocus();
      },
    );
  }
}
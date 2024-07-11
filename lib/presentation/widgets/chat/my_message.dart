import 'package:flutter/material.dart';
import 'package:cucp_yes_no_app/domain/entities/message.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.message});

  final Message message;
  
  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
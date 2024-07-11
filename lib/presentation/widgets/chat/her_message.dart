import 'package:flutter/material.dart';
import 'package:cucp_yes_no_app/domain/entities/message.dart';

class HerMessage extends StatelessWidget {
  const HerMessage({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          )
        ),
        const SizedBox(height: 5),

        // const _Image(),
        if(message.imageUrl != null) _Image(imageUrl: message.imageUrl!),

        const SizedBox(height: 20)
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: size.width * 0.5,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: size.width * 0.5,
          height: 150,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null
            ),
          ),
        );
      },
      ),
    );
  }
}
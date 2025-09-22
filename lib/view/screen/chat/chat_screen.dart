import 'package:flutter/material.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Chat'),
      body: const Center(
        child: Text('This is Chat Screen'),
      ),
    );
  }
}

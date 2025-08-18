import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/chats_cubit/chats_cubit.dart';
import 'package:whats_app/presentation/widgets/show_all_chat_screen.dart';
import 'package:whats_app/utills/service_locator/service_locators.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WhatsApp')),
      body: BlocProvider(
        create: (context) => sl<ChatsCubit>()..loadChats(),
        child: const ShowAllChatScreen(),
      ),
    );
  }
}

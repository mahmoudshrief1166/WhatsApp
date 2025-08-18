import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/entities/users_entity.dart';
import 'package:whats_app/presentation/controllers/send_message_cubit/cubit/send_message_cubit.dart';
import 'package:whats_app/presentation/widgets/send_message.dart';
import 'package:whats_app/presentation/widgets/show_all_message_conversation.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';
import 'package:whats_app/utills/service_locator/service_locators.dart';

class ConversitionScreen extends StatefulWidget {
  final UsersEntity sender;
  final MessageEntity? recieveMessage;

  const ConversitionScreen({
    super.key,
    required this.sender,
    this.recieveMessage,
  });

  @override
  State<ConversitionScreen> createState() => _ConversitionScreenState();
}

class _ConversitionScreenState extends State<ConversitionScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SendMessageCubit>()..loadMessages(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.sender.imgUrl ?? ''),
                radius: AppConstants.screenWidth(context) * 0.06,
              ),
              SizedBox(width: AppConstants.screenWidth(context) * 0.02),
              Expanded(
                child: Text(
                  widget.sender.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: (AppConstants.screenWidth(context) * 0.050).clamp(
                      12,
                      18,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: ShowAllMessageConversation(widget: widget)),
              SendMessage(messageController: messageController, widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}

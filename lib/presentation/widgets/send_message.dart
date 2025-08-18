import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/presentation/controllers/send_message_cubit/cubit/send_message_cubit.dart';
import 'package:whats_app/presentation/screens/conversition_screen.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';
import 'package:whats_app/utills/enums/message_status.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
    required this.messageController,
    required this.widget,
  });

  final TextEditingController messageController;
  final ConversitionScreen widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenWidth(context) * 0.03,
            vertical: AppConstants.screenHeight(context) * 0.02,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _sendMessage(context),
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.surface,
                    hintText: 'Message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.screenWidth(context) * 0.03,
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: AppConstants.screenWidth(context) * 0.003,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.screenWidth(context) * 0.03,
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: AppConstants.screenWidth(context) * 0.003,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.screenWidth(context) * 0.03,
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: AppConstants.screenWidth(context) * 0.003,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppConstants.screenWidth(context) * 0.01),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                  icon: Icon(Icons.send),
                  iconSize: AppConstants.screenWidth(context) * 0.06,
                  onPressed: () => _sendMessage(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage(BuildContext context) {
    final content = messageController.text.trim();
    if (content.isNotEmpty) {
      final message = MessageEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        chatId: widget.recieveMessage?.chatId ?? '',
        senderId: widget.sender.id,
        content: content,
        timestamp: DateTime.now(),
        status: MessageStatus.sent,
      );
      context.read<SendMessageCubit>().sendMessage(message);
      messageController.clear();
    }
  }
}

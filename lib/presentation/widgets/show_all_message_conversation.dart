import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:whats_app/presentation/controllers/send_message_cubit/cubit/send_message_cubit.dart';
import 'package:whats_app/presentation/screens/conversition_screen.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';

class ShowAllMessageConversation extends StatelessWidget {
  const ShowAllMessageConversation({super.key, required this.widget}) : super();
  final ConversitionScreen widget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SendMessageCubit, SendMessageState>(
        builder: (context, state) {
          if (state is SendMessageInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SendMessageSuccess) {
            final messages = state.messages;

            if (messages.isEmpty) {
              return const Center(child: Text("No messages yet"));
            }

            return AnimationLimiter(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[messages.length - 1 - index];
                  final bool isMe = msg.senderId == widget.sender.id;

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 400),
                    child: SlideAnimation(
                      horizontalOffset: isMe
                          ? AppConstants.screenHeight(context) * 0.5
                          : -(AppConstants.screenHeight(context) * 0.5),
                      curve: Curves.easeOutCubic,
                      child: FadeInAnimation(
                        child: Align(
                          alignment: isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: AppConstants.screenWidth(context) * 0.8,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical:
                                  AppConstants.screenHeight(context) * 0.02,
                              horizontal:
                                  AppConstants.screenWidth(context) * 0.02,
                            ),
                            padding: EdgeInsets.all(
                              AppConstants.screenWidth(context) * 0.03,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppConstants.screenWidth(context) * 0.03,
                              ),
                              color: isMe
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.surface,
                            ),
                            child: Text(
                              msg.content,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    fontSize:
                                        (AppConstants.screenWidth(context) *
                                                0.035)
                                            .clamp(12, 18),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is SendMessageError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return const Center(child: Text('No messages found'));
          }
        },
      ),
    );
  }
}

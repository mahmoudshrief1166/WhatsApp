import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/presentation/controllers/chats_cubit/chats_cubit.dart';
import 'package:whats_app/presentation/screens/conversition_screen.dart';
import 'package:whats_app/utills/app_constants/app_constants.dart';

class ShowAllChatScreen extends StatelessWidget {
  const ShowAllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppConstants.screenWidth(context);
    final height = AppConstants.screenHeight(context);

    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is ChatsInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatsLoaded) {
          return ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              final chat = state.chats[index];
              // sender
              final sender = chat.users.firstWhere(
                (user) => user.sender == "true",
              );
              // recieveMessage
              final recieveMessage = chat.lastMessage?.lastWhere(
                (msg) => msg.senderId == sender.id,
              );

              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: (width * 0.04).clamp(14, 18),
                  vertical: (height * 0.01).clamp(8, 12),
                ),
                title: Text(
                  sender.name,
                  style: TextStyle(
                    fontSize: (width * 0.04).clamp(14.0, 18.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  recieveMessage?.content ?? 'no message',
                  style: TextStyle(
                    fontSize: (width * 0.035).clamp(12.0, 16.0),
                    color: Colors.grey[700],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: CircleAvatar(
                  radius: width * 0.07,
                  backgroundImage: sender.imgUrl != null
                      ? NetworkImage(sender.imgUrl!)
                      : null,
                  child: sender.imgUrl == null
                      ? Icon(Icons.person, size: width * 0.06)
                      : null,
                ),
                trailing: chat.lastMessage != null
                    ? Text(
                        '${recieveMessage?.timestamp.hour.toString().padLeft(2, '0')} : ${recieveMessage?.timestamp.minute.toString().padLeft(2, '0')} ${(recieveMessage?.timestamp.hour ?? 0) >= 12 ? 'PM' : 'AM'}',
                        style: TextStyle(
                          fontSize: (width * 0.03).clamp(11.0, 14.0),
                        ),
                      )
                    : Text(
                        'No messages',
                        style: TextStyle(
                          fontSize: (width * 0.03).clamp(11.0, 14.0),
                          color: Colors.grey[600],
                        ),
                      ),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ConversitionScreen(
                            sender: sender,
                            recieveMessage: recieveMessage,
                          ),
                      transitionDuration: const Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.2, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.elasticOut;
                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
              );
            },
          );
        } else if (state is ChatsError) {
          return Center(child: Text('Error loading chatss: ${state.message}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

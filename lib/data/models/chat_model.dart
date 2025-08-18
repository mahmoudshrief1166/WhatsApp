import 'package:whats_app/data/models/message_model.dart';
import 'package:whats_app/data/models/user_model.dart';
import 'package:whats_app/domain/entities/chats_entity.dart';

class ChatModel extends ChatsEntity {
  const ChatModel({required super.id, required super.users, super.lastMessage});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    final List<MessageModel> messages =
        (json['messages'] as List<dynamic>? ?? [])
            .map((msg) => MessageModel.fromJson(msg))
            .toList();

    final List<UserModel> users = (json['users'] as List<dynamic>? ?? [])
        .map((user) => UserModel.fromJson(user))
        .toList();

    return ChatModel(
      id: json['id'] as String,
      users: users,
      lastMessage: messages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "users": users.map((u) => (u as UserModel).toJson()).toList(),
      "lastMessage": lastMessage != null
          ? (lastMessage as MessageModel).toJson()
          : null,
    };
  }
}

import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/entities/chats_entity.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

abstract class BaseChatRepository extends Equatable {
  Future<List<ChatsEntity>> getAllChats();
  Future<List<MessageEntity>> getAllMessages(String chatId);
  Future<void> sendMessage(String chatId, MessageEntity message);

  @override
  List<Object?> get props => [];
}

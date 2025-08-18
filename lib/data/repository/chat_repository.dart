import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/domain/entities/chats_entity.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/repository/base_chat_repository.dart';

class ChatRepository extends BaseChatRepository {
  final BaseLocalDataSource localDataSource;
  ChatRepository(this.localDataSource);
  @override
  Future<List<ChatsEntity>> getAllChats() async {
    final chats = await localDataSource.getChats();
    return chats;
  }

  @override
  Future<List<MessageEntity>> getAllMessages(String chatId) async {
    final messages = await localDataSource.getMessages();
    return messages.where((message) => message.chatId == chatId).toList();
  }

  @override
  Future<void> sendMessage(String chatId, MessageEntity message)async {
     final messages = await localDataSource.getMessages();
     final addMessage=List<MessageEntity>.from(messages)..add(message);
     await localDataSource.saveMessages(addMessage);
  }
}

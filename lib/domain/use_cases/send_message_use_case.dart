import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/repository/base_chat_repository.dart';

class SendMessageUseCase {
  final BaseChatRepository chatRepository;
  SendMessageUseCase(this.chatRepository);
  Future<void> call(String chatId, MessageEntity message) async {
    await chatRepository.sendMessage(chatId, message);
  }
}

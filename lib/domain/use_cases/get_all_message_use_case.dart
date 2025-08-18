import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/repository/base_chat_repository.dart';

class GetAllMessageUseCase {
  final BaseChatRepository chatRepository;
  GetAllMessageUseCase(this.chatRepository);
  Future<List<MessageEntity>> call(String chatId) async {
    return await chatRepository.getAllMessages(chatId);
  }
}

import 'package:whats_app/domain/entities/chats_entity.dart';
import 'package:whats_app/domain/repository/base_chat_repository.dart';

class GetAllChatsUseCase {
  final BaseChatRepository chatRepository;
  GetAllChatsUseCase(this.chatRepository);
  Future<List<ChatsEntity>> call() async {
    return await chatRepository.getAllChats();
  }
}

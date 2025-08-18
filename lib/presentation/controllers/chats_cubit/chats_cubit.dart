import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/domain/entities/chats_entity.dart';
import 'package:whats_app/domain/use_cases/get_all_chats_use_case.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final GetAllChatsUseCase getAllChatsUseCase;

  ChatsCubit({required this.getAllChatsUseCase}) : super(const ChatsInitial());

  static ChatsCubit get(context) => BlocProvider.of(context);

  Future<void> loadChats() async {
    emit(const ChatsLoading());

    try {
      final chats = await getAllChatsUseCase();

      if (chats.isEmpty) {
        emit(const ChatsLoaded([]));
      } else {
        emit(ChatsLoaded(chats));
      }
      debugPrint("Got chats: $chats");
    } catch (e) {
      emit(ChatsError(e.toString()));
    }
  }
}

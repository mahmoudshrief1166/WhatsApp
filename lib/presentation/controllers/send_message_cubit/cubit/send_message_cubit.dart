import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final BaseLocalDataSource localDataSource;

  SendMessageCubit({required this.localDataSource})
    : super(SendMessageInitial()) {
    loadMessages();
  }

  Future<void> loadMessages() async {
    try {
      emit(SendMessageLoading());
      final msgs = await localDataSource.getMessages();
      msgs.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      emit(SendMessageSuccess(messages: msgs));
    } catch (e) {
      emit(SendMessageError(e.toString()));
    }
  }

  Future<void> sendMessage(MessageEntity message) async {
    try {
      if (state is SendMessageSuccess) {
        final currentState = state as SendMessageSuccess;
        final updatedMessages = List<MessageEntity>.from(currentState.messages)
          ..add(message);
        updatedMessages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        await localDataSource.saveMessages(updatedMessages);

        emit(SendMessageSuccess(messages: updatedMessages));
      } else {
        final messages = [message];
        await localDataSource.saveMessages(messages);
        emit(SendMessageSuccess(messages: messages));
      }
    } catch (e) {
      emit(SendMessageError(e.toString()));
    }
  }
}

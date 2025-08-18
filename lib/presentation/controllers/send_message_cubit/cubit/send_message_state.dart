part of 'send_message_cubit.dart';

sealed class SendMessageState extends Equatable {
  const SendMessageState();

  @override
  List<Object> get props => [];
}

final class SendMessageInitial extends SendMessageState {}


final class SendMessageLoading extends SendMessageState {}


final class SendMessageSuccess extends SendMessageState {
  final List<MessageEntity> messages;

  const SendMessageSuccess({required this.messages});

  SendMessageSuccess copyWith({List<MessageEntity>? messages}) {
    return SendMessageSuccess(
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => [messages];
}

final class SendMessageError extends SendMessageState {
  final String error;
  const SendMessageError(this.error);

  @override
  List<Object> get props => [error];
}

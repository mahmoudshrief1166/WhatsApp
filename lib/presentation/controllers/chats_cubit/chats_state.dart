part of 'chats_cubit.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object?> get props => [];
}

class ChatsInitial extends ChatsState {
  const ChatsInitial();
}

class ChatsLoading extends ChatsState {
  const ChatsLoading();
}

class ChatsLoaded extends ChatsState {
  final List<ChatsEntity> chats;
  const ChatsLoaded(this.chats);

  @override
  List<Object?> get props => [chats];
}

class ChatsError extends ChatsState {
  final String message;
  const ChatsError(this.message);

  @override
  List<Object?> get props => [message];
}

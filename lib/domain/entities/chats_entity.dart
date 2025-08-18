import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/entities/message_entity.dart';
import 'package:whats_app/domain/entities/users_entity.dart';

class ChatsEntity extends Equatable {
  final String id;
  final List<UsersEntity> users;
  final List<MessageEntity>? lastMessage;

  const ChatsEntity({
    required this.id,
    required this.users,
    required this.lastMessage,
  });

  @override
  List<Object?> get props => [id, users, lastMessage];
}

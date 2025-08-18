import 'package:equatable/equatable.dart';
import 'package:whats_app/utills/enums/message_status.dart';

class MessageEntity extends Equatable {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageStatus status;

  const MessageEntity({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.status,
  });

  @override
  List<Object?> get props => [id, chatId,  senderId, content, timestamp, status];
}

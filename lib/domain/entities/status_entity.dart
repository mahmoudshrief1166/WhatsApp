import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/entities/users_entity.dart';

class StatusEntity extends Equatable {
  final String id;
  final UsersEntity user;
  final String mediaUrl;
  final DateTime timestamp;
  final Duration duration;

  const StatusEntity({
    required this.id,
    required this.user,
    required this.mediaUrl,
    required this.timestamp,
    required this.duration,
  });

  @override
  List<Object?> get props => [id, user, mediaUrl, timestamp, duration];
}


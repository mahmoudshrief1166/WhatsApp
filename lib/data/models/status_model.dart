import 'package:whats_app/data/models/user_model.dart';
import 'package:whats_app/domain/entities/status_entity.dart';

class StatusModel extends StatusEntity {
  const StatusModel({
    required super.id,
    required super.user,
    required super.mediaUrl,
    required super.timestamp,
    required super.duration,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      id: json['id']?.toString() ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
      mediaUrl: json['mediaUrl']?.toString() ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        json['timestamp'] as int,
        isUtc: false,
      ),

      duration: Duration(
        milliseconds: (json['duration'] as num?)?.toInt() ?? 0,
      ),
    );
  }
}

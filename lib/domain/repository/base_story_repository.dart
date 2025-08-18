import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/entities/status_entity.dart';

abstract class BaseStoryRepository extends Equatable {
  Future<List<StatusEntity>> getAllStories();
  Future<StatusEntity> addStory(StatusEntity story);

  @override
  List<Object?> get props => [];
}

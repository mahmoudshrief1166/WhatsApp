import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/domain/entities/status_entity.dart';
import 'package:whats_app/domain/repository/base_story_repository.dart';

class StoryRepository extends BaseStoryRepository{
  final BaseLocalDataSource localDataSource;
  StoryRepository(this.localDataSource);
  @override
  Future<StatusEntity> addStory(StatusEntity story) {
    return Future.value(story);
  }

  @override
  Future<List<StatusEntity>> getAllStories() {
    final stories=localDataSource.getStories();
    return stories;
  }
}
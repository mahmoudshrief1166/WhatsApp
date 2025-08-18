import 'package:whats_app/domain/entities/status_entity.dart';
import 'package:whats_app/domain/repository/base_story_repository.dart';

class AddStoryUseCase {
  final BaseStoryRepository storyRepository;
  AddStoryUseCase(this.storyRepository);
  Future<void> call(StatusEntity status) async {
    await storyRepository.addStory(status);
  }
}

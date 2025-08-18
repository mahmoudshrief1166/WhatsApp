import 'package:whats_app/domain/entities/status_entity.dart';
import 'package:whats_app/domain/repository/base_story_repository.dart';

class GetAllStoryUseCase {
  final BaseStoryRepository storyRepository;
  GetAllStoryUseCase(this.storyRepository);
  Future<List<StatusEntity>> call() async {
    return await storyRepository.getAllStories();
  }
}

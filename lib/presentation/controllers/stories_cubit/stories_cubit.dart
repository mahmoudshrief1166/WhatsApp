import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/domain/entities/status_entity.dart';

part 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  final BaseLocalDataSource localDataSource;
  StoriesCubit({required this.localDataSource}) : super(StoriesInitial()){
    getStatus();
  }

  Future<void> getStatus()async{
    emit(StoriesLoading());
    try {
      final stories = await localDataSource.getStories();
      emit(StoriesLoaded(stories: stories));
    } catch (e) {
      emit(StoriesError(e.toString()));
    }
  }
}

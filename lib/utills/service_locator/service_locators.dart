import 'package:get_it/get_it.dart';
import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/data/repository/chat_repository.dart';
import 'package:whats_app/domain/repository/base_chat_repository.dart';
import 'package:whats_app/domain/use_cases/get_all_chats_use_case.dart';
import 'package:whats_app/presentation/controllers/chats_cubit/chats_cubit.dart';
import 'package:whats_app/presentation/controllers/send_message_cubit/cubit/send_message_cubit.dart';
import 'package:whats_app/presentation/controllers/stories_cubit/stories_cubit.dart';

final sl = GetIt.instance;

class ServiceLocators {
  static void init() {
    // Register your services here

    //datasources
    sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

    //repositories
    sl.registerLazySingleton<BaseChatRepository>(() => ChatRepository(sl()));

    //usecases
    sl.registerLazySingleton(() => GetAllChatsUseCase(sl()));

    //cubits
    sl.registerFactory(() => ChatsCubit(
      getAllChatsUseCase: sl(),
    ));
    sl.registerFactory(() => SendMessageCubit(
      localDataSource: sl(),
    ));
    sl.registerFactory(() => StoriesCubit(
      localDataSource: sl(),
    ));
  }
}

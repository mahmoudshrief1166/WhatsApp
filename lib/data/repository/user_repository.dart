import 'package:whats_app/data/data_sources/local_data_source.dart';
import 'package:whats_app/domain/entities/users_entity.dart';
import 'package:whats_app/domain/repository/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final BaseLocalDataSource localDataSource;
  UserRepository(this.localDataSource);
  @override
  Future<List<UsersEntity>> getAllUsers() async {
    final users = await localDataSource.getUsers();
    return users;
  }

  @override
  Future<UsersEntity> getUserById(String userId) {
    final users = localDataSource.getUsers();
    return users.then(
      (user) => user.firstWhere(
        (user) => user.id == userId,
        orElse: () => throw Exception('User not found'),
      ),
    );
  }
}

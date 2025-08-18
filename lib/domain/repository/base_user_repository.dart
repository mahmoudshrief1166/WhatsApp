import 'package:equatable/equatable.dart';
import 'package:whats_app/domain/entities/users_entity.dart';

abstract class BaseUserRepository extends Equatable {
  Future<List<UsersEntity>> getAllUsers();
  Future<UsersEntity> getUserById(String userId);

  @override
  List<Object?> get props => [];
}

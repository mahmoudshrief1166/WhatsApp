import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String id;
  final String name;
  final String? sender;
  final String? imgUrl;

  const UsersEntity({required this.id, required this.name,  this.sender, this.imgUrl});

  @override
  List<Object?> get props => [id, name, imgUrl];
}

import 'package:whats_app/domain/entities/users_entity.dart';

class UserModel extends UsersEntity {
  const UserModel({
    required super.id,
    required super.name,
     super.sender,
    super.imgUrl, //
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sender: json['sender'] as String,
      imgUrl: json['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "imgUrl": imgUrl, "sender": sender};
  }
}

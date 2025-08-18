import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whats_app/data/models/chat_model.dart';
import 'package:whats_app/data/models/message_model.dart';
import 'package:whats_app/data/models/status_model.dart';
import 'package:whats_app/data/models/user_model.dart';
import 'package:whats_app/domain/entities/chats_entity.dart';
import 'package:whats_app/domain/entities/message_entity.dart';

abstract class BaseLocalDataSource {
  Future<List<UserModel>> getUsers();
  Future<List<ChatsEntity>> getChats();
  Future<List<MessageModel>> getMessages();
  Future<List<StatusModel>> getStories();
  Future<void> saveMessages(List<MessageEntity> messages);
}

class LocalDataSource extends BaseLocalDataSource {
  @override
  Future<List<StatusModel>> getStories() async {
    final response = await rootBundle.loadString('assets/stories.json');
    final List<dynamic> statuses = json.decode(response);
    return statuses.map((status) => StatusModel.fromJson(status)).toList();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await rootBundle.loadString('assets/users.json');
    final List<dynamic> users = json.decode(response);
    return users.map((user) => UserModel.fromJson(user)).toList();
  }

  @override
  Future<List<ChatsEntity>> getChats() async {
    final response = await rootBundle.loadString('assets/chats.json');
    final List<dynamic> chats = json.decode(response);
    return chats.map((chat) => ChatModel.fromJson(chat)).toList();
  }

  //path_provider
  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final path = await _getLocalPath;
    return File('$path/messages.json');
  }

  @override
  Future<void> saveMessages(List<MessageEntity> messages) async {
    final file = await _getLocalFile;
    final jsonList = messages
        .map(
          (m) => MessageModel(
            id: m.id,
            chatId: m.chatId,
            senderId: m.senderId,
            content: m.content,
            timestamp: m.timestamp,
            status: m.status,
          ).toJson(),
        )
        .toList();

    await file.writeAsString(json.encode(jsonList));
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    final file = await _getLocalFile;
    if (!file.existsSync()) {
      final response = await rootBundle.loadString('assets/messages.json');
      final List<dynamic> messages = json.decode(response);
      return messages.map((message) => MessageModel.fromJson(message)).toList();
    } else {
      final contents = await file.readAsString();
      final List<dynamic> messages = json.decode(contents);
      final messageList = messages
          .map((message) => MessageModel.fromJson(message))
          .toList();
      messageList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      return messageList;
    }
  }
}

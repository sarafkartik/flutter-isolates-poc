import 'dart:async';
import 'package:flutter_isochat/data/mapper/random_chat_mapper.dart';
import 'package:flutter_isochat/data/repository/remote_client/base_remote_client.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';

abstract class ChatRemoteClient {
  Future<RandomChatModel> getChatMessage();
}

class ChatRemoteClientImpl extends BaseRemoteClient
    implements ChatRemoteClient {
  @override
  Future<RandomChatModel> getChatMessage() {
    return apiClient
        .getRandomChat()
        .then((value) => ChatMapper().map(value))
        .catchError(handleError<RandomChatModel>);
  }
}

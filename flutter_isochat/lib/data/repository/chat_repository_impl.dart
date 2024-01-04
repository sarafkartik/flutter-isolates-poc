import 'package:flutter_isochat/data/repository/chat_repository.dart';
import 'package:flutter_isochat/data/repository/remote_client/chat_remote_client.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteClient _chatRemoteClient;

  ChatRepositoryImpl(this._chatRemoteClient);

  @override
  Future<RandomChatModel> getChatMessage() => _chatRemoteClient.getChatMessage();
}

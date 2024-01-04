import 'package:flutter_isochat/domain/model/random_chat_model.dart';

abstract class ChatRepository {
  Future<RandomChatModel> getChatMessage();
}

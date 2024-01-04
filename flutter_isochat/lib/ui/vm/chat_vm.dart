import 'package:flutter_isochat/app/usecases/chat_usecase.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatVM extends StateNotifier<Map<String, List<RandomChatModel>>> {
  ChatVM(this._chatUseCase) : super({});
  final String _chatRoom1Key = "Room 1";
  final String _chatRoom2Key = "Room 2";
  final String _chatRoom3Key = "Room 3";

  final ChatUseCase _chatUseCase;

  void initChatRooms() {
    state = {_chatRoom1Key: [], _chatRoom2Key: [], _chatRoom3Key: []};
    final chatRoomList = [_chatRoom1Key, _chatRoom2Key, _chatRoom3Key];
    _chatUseCase.startChattingInChatRooms(chatRoomList, _addMessage);
  }

  void _addMessage(String roomName, RandomChatModel message) {
    state[roomName] = [...state[roomName]!, message];
    state = Map.from(state);
  }
}

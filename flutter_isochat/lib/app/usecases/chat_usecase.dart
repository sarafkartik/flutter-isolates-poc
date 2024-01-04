import 'dart:async';
import 'dart:isolate';

import 'package:flutter_isochat/data/repository/chat_repository.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';
import 'package:flutter_isochat/domain/vo/isolate_vo.dart';

class ChatUseCase {
  final ChatRepository _chatRepository;

  ChatUseCase(this._chatRepository);

  startChattingInChatRooms(List<String> roomKeys,
      Function(String, RandomChatModel) onReceiveMessage) {
    for (var key in roomKeys) {
      final receivePort = ReceivePort();
      final isolateVo = IsolateVo(key, receivePort.sendPort);
      Isolate.spawn(_getChatMessage, isolateVo);
      receivePort.listen((message) {
        onReceiveMessage(key, message);
      });
    }
  }

  void _getChatMessage(IsolateVo isolateVo) async {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      final message = await _chatRepository.getChatMessage();
      isolateVo.sendPort.send(message);
    });
  }
}

import 'package:flutter_isochat/app/provider/chat_usecase_provider.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';
import 'package:flutter_isochat/ui/vm/chat_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatVmprovider =
    StateNotifierProvider<ChatVM, Map<String, List<RandomChatModel>>>((ref) {
  return ChatVM(ref.read(chatUseCaseProvider));
});

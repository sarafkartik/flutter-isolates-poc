import 'package:flutter_isochat/app/usecases/chat_usecase.dart';
import 'package:flutter_isochat/data/provider/chat_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatUseCaseProvider = Provider<ChatUseCase>(
    (ref) => ChatUseCase(ref.read(chatRepositoryProvider)));

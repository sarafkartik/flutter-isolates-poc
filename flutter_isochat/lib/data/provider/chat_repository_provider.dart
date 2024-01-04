import 'package:flutter_isochat/data/provider/chat_remote_client_provider.dart';
import 'package:flutter_isochat/data/repository/chat_repository.dart';
import 'package:flutter_isochat/data/repository/chat_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepositoryProvider = Provider<ChatRepository>(
    (ref) => ChatRepositoryImpl(ref.read(chatRemoteClientProvider)));

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_isochat/data/repository/remote_client/chat_remote_client.dart';

final chatRemoteClientProvider =
    Provider<ChatRemoteClient>((ref) => ChatRemoteClientImpl());

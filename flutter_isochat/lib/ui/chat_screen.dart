import 'package:flutter/material.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';
import 'package:flutter_isochat/ui/provider/chat_vm_provider.dart';
import 'package:flutter_isochat/ui/vm/chat_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  ChatVM? _chatVM;

  @override
  void initState() {
    super.initState();
    _chatVM = ref.read(chatVmprovider.notifier);
    Future.delayed(Duration.zero, () {
      _chatVM?.initChatRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allChats = ref.watch(chatVmprovider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Chat Rooms'),
      ),
      body: _buildChatRooms(allChats),
    );
  }

  _buildChatRooms(Map<String, List<RandomChatModel>> allChats) {
    return ListView.builder(
      itemCount: allChats.length,
      itemBuilder: (context, index) {
        final roomKey = allChats.keys.elementAt(index);
        final chatPayload = allChats[roomKey] ?? [];

        return Card(
          child: ListTile(
            tileColor: Colors.black,
            textColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            title: Text(roomKey),
            subtitle: chatPayload != []
                ? Text(chatPayload.isNotEmpty
                    ? _createChatMessage(chatPayload.last)
                    : _getPlaceholderText())
                : Text(_getPlaceholderText()),
          ),
        );
      },
    );
  }

  String _createChatMessage(RandomChatModel last) {
    return "\n${last.chat}\n\nfrom: ${last.author}";
  }

  String _getPlaceholderText() {
    return "\n---\n\nfrom: ---";
  }
}

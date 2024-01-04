import 'package:flutter_isochat/data/mapper/mapper.dart';
import 'package:flutter_isochat/domain/dto/random_chat_dto.dart';
import 'package:flutter_isochat/domain/model/random_chat_model.dart';


class ChatMapper extends Mapper<RandomChatDto, RandomChatModel>{
  @override
  RandomChatModel map(RandomChatDto input) {
    return RandomChatModel(input.content, input.authorSlug);
  }

}
import 'dart:convert';

RandomChatDto randomChatModelFromJson(String str) =>
    RandomChatDto.fromJson(json.decode(str));

String randomChatModelToJson(RandomChatDto data) =>
    json.encode(data.toJson());

class RandomChatDto {
  String? id;
  String? content;
  String? authorSlug;

  RandomChatDto({
    this.id,
    this.content,
    this.authorSlug,
  });

  factory RandomChatDto.fromJson(Map<String, dynamic> json) =>
      RandomChatDto(
        id: json["_id"],
        content: json["content"],
        authorSlug: json["authorSlug"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "authorSlug": authorSlug,
      };
}

class Messagesmodel {
  final String messages;
  final String id;

  Messagesmodel({required this.messages, required this.id});
  factory Messagesmodel.fromjson(json) {
    return Messagesmodel(
        messages: json["messages"] ?? "", id: json["id"] ?? "");
  }
}

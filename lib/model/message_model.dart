import 'dart:convert';

class MessageModel {
  bool success;
  String message;

  MessageModel({required this.success, required this.message});
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      MessageModel(message: json["message"], 
      success: json["success"]
    );
    
  Map<String, dynamic> toJson() => {"message": message, "success": success};
}
MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));
String messageModelToJson(MessageModel data) => json.encode(data.toJson());



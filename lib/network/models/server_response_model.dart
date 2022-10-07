
import 'dart:convert';

ServerResponse serverResponseFromJson(String str) => ServerResponse.fromJson(json.decode(str));

String serverResponseToJson(ServerResponse data) => json.encode(data.toJson());

class ServerResponse {
  ServerResponse({
    this.code,
    this.message,
    this.payload,
  });

  int? code;
  String? message;
  List<dynamic>? payload;

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
    code: json["code"],
    message: json["message"],
    payload: List<dynamic>.from(json["payload"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "payload": List<dynamic>.from(payload!.map((x) => x)),
  };
}

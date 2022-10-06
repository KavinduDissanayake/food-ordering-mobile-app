// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.message,
    this.payload,
  });

  String? message;
  User? payload;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    message: json["message"],
    payload: User .fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.lastSeen,
    this.isOnline,
    this.phone,
    this.roles,
    this.avatarUrl,
    this.accessToken,
  });

  int? id;
  String? firstName;
  String?  lastName;
  String? email;
  String? facebookUrl;
  String? instagramUrl;
  String? twitterUrl;

  String? lastSeen;
  bool? isOnline;
  String? phone;
  String? roles;
  String? avatarUrl;
  String? accessToken;


   String getFullName(){
    return "$firstName  $lastName ";
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    firstName: json["name"] ?? "N/A",
    lastName: json["last_name"] ?? "N/A",
    email: json["email"] ?? "N/A",
    facebookUrl: json["facebook_url"] ?? "N/A",
    instagramUrl: json["instagram_url"] ?? "N/A",
    twitterUrl: json["twitter_url"] ?? "N/A",

    lastSeen: json["last_seen"] ?? "",
    isOnline: json["is_online"] ??  false,
    phone: json["phone"] ?? "N/A",
    roles: json["role"] ?? "N/A",
    avatarUrl: json["avatar_url"] ?? "N/A",
    accessToken: json["access_token"] ?? "N/A",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": firstName,
    "last_name": lastName,
    "email": email,
    "facebook_url": facebookUrl ?? "N/A",
    "instagram_url": instagramUrl ?? "N/A",
    "twitter_url": twitterUrl ?? "N/A",
    "last_seen": lastSeen,
    "is_online": isOnline,
    "phone": phone,
    "roles": roles,
    "avatar_url": avatarUrl,
    "access_token": accessToken,
  };


}

// To parse this JSON data, do
//
//     final authResponseFromJson = authResponseFromJsonFromJson(jsonString);

import 'dart:convert';

AuthResponseFromJson authResponseFromJson(String str) => AuthResponseFromJson.fromJson(json.decode(str));

String authResponseFromJsonToJson(AuthResponseFromJson data) => json.encode(data.toJson());

class AuthResponseFromJson {
  AuthResponseFromJson({
    this.code,
    this.message,
    this.payload,
  });

  int? code;
  String? message;
  User? payload;

  factory AuthResponseFromJson.fromJson(Map<String, dynamic> json) => AuthResponseFromJson(
    code: json["code"],
    message: json["message"],
    payload: User.fromJson(json["payload"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "payload": payload!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.address,
    this.wishlist,
    this.orders,
    this.cart,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
  });

  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatarUrl;
  String? address;
  List<String>? wishlist;
  List<String>? orders;
  List<Cart>? cart;
  String? createdAt;
  String? updatedAt;
  String? accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    avatarUrl: json["avatarUrl"],
    address: json["address"],
    wishlist: List<String>.from(json["wishlist"].map((x) => x)),
    orders: List<String>.from(json["orders"].map((x) => x)),
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    createdAt:json["createdAt"],
    updatedAt: json["updatedAt"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "avatarUrl": avatarUrl,
    "address": address,
    "wishlist": List<dynamic>.from(wishlist!.map((x) => x)),
    "orders": List<dynamic>.from(orders!.map((x) => x)),
    "cart": List<dynamic>.from(cart!.map((x) => x.toJson())),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "accessToken": accessToken,
  };
}

class Cart {
  Cart({
    this.product,
    this.unit,
    this.id,
  });

  String? product;
  int? unit;
  String? id;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    product: json["product"],
    unit: json["unit"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product,
    "unit": unit,
    "_id": id,
  };
}

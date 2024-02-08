import 'dart:convert';

class UserFirebase {
  String? id;
  String name;
  String email;
  String address;
  String phone;
  String photo;

  UserFirebase({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.photo,
  });

  factory UserFirebase.fromJson(String str) =>
      UserFirebase.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserFirebase.fromMap(Map<String, dynamic> json) => UserFirebase(
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "photo": photo,
      };

  UserFirebase copy() => UserFirebase(
      name: name,
      email: email,
      address: address,
      phone: phone,
      photo: photo,
      id: id);
}

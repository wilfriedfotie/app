// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserResponse {
  final String id;
  final String name;
  final String? photo;

  const UserResponse({
    required this.id,
    required this.name,
    this.photo,
  });

  UserResponse copyWith({
    String? id,
    String? name,
    String? photo,
  }) {
    return UserResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      id: map['id'] as String,
      name: map['name'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserResponse(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}

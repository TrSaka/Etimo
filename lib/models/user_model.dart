// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminUser {
  final String email;
  final String password;
  AdminUser({
    required this.email,
    required this.password,
  });

  AdminUser copyWith({
    String? email,
    String? password,
  }) {
    return AdminUser(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AdminUser.fromMap(Map<String, dynamic> map) {
    return AdminUser(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminUser.fromJson(String source) =>
      AdminUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminUser(email: $email, password: $password)';

  @override
  bool operator ==(covariant AdminUser other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

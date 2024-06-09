class AuthEntity {
  AuthEntity({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = email;
    data['password'] = password;

    return data;
  }
}

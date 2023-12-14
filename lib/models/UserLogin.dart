class UserLogin {
  final String id;
  final String email;
  final String username;
  final String token;
  final String avatar;
  final String active;
  final String coins;

  UserLogin({
    required this.id,
    this.email = "",
    required this.username,
    required this.token,
    required this.avatar,
    required this.active,
    required this.coins,
  });


  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      id: json['data']['id'] as String,
      // email : json['data']['email'] as String,
      username: json['data']['username'] as String,
      token: json['data']['token'] as String,
      avatar: json['data']['avatar'] as String,
      active: json['data']['active'] as String,
      coins: json['data']['coins'] as String,
    );
  }
}

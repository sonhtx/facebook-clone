class User {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String token;
  final bool avatar;
  final bool active;
  final int coins;

  User({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.token,
    required this.avatar,
    required this.active,
    required this.coins,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'] as int,
      email : json['data']['email'] as String,
      firstname: json['data']['firstname'] as String,
      lastname: json['data']['lastname'] as String,
      token: json['data']['token'] as String,
      avatar: json['data']['avatar'] as bool,
      active: json['data']['active'] as bool,
      coins: json['data']['coins'] as int,
    );
  }
}

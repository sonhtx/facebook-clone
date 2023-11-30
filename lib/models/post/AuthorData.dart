
class AuthorData{
  final String id;
  final String name;
  final String avatar;
  final String? coins;

  AuthorData( {required this.id, required this.name, required this.avatar, required this.coins});

  factory AuthorData.fromJson(Map<String, dynamic> json) {
    return AuthorData(
      id: json['id'] as String,
      name : json['name'] as String,
      avatar : json['avatar'] as String,
      coins : json['coins'] as String?,
    );
  }
}
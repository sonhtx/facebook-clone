class UserBlocked{
  final String id;
  final String name;
  final String avatar;

  UserBlocked({required this.id, required this.name, required this.avatar});

  factory UserBlocked.fromJson(Map<String,dynamic>json){
    return UserBlocked(
        id: json['id'] as String,
        name: json['name'] as String,
        avatar: json['avatar'] as String
    );
  }
}
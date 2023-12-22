class UserBlocked{
  final String id;
  final String name;
  final String avatar;

  UserBlocked({required this.id, required this.name, required this.avatar});

  factory UserBlocked.fromJson(Map<String,dynamic>json){
    String? avatar;
    if(json['avatar'] != null){
      avatar = json['avatar'];
    }else{
      avatar = "";
    }
    return UserBlocked(
        id: json['id'] as String,
        name: json['name'] as String,
        avatar: avatar as String
    );
  }
}

class Friend{

  final String id;
  final String username;
  final String avatar;
  final String created;
  final String sameFriends;

  Friend({required this.id, required this.username,
    required this.avatar, required this.created, required this.sameFriends});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      created: json['created'] as String,
      sameFriends: json['same_friends']as String,
    );
  }

}
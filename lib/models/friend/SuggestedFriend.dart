class SuggestedFriend{

  final String id;
  final String username;
  final String avatar;
  final String created;
  final String sameFriends;

  SuggestedFriend({required this.id, required this.username,
    required this.avatar, required this.created, required this.sameFriends});

  factory SuggestedFriend.fromJson(Map<String, dynamic> json) {
    return SuggestedFriend(
      id: json['id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      created: json['created'] as String,
      sameFriends: json['same_friends']as String,
    );
  }
}
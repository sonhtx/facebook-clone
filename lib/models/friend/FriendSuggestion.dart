
class FriendSuggestion{

  final String id;
  final String username;
  final String avatar;
  final String created;
  final String same_friends;

  FriendSuggestion({required this.id, required this.username,
    required this.avatar, required this.created, required this.same_friends});

  factory FriendSuggestion.fromJson(Map<String, dynamic> json) {
    return FriendSuggestion(
      id: json['id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      created: json['created'] as String,
      same_friends: json['same_friends']as String,
    );
  }

}
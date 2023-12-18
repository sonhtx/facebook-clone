
class RequestedFriend{

  final String id;
  final String username;
  final String avatar;
  final String created;
  final String same_friends;

  RequestedFriend({required this.id, required this.username,
    required this.avatar, required this.created, required this.same_friends});

  factory RequestedFriend.fromJson(Map<String, dynamic> json) {
    return RequestedFriend(
      id: json['id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String,
      created: json['created'] as String,
      same_friends: json['same_friends']as String,
    );
  }

}
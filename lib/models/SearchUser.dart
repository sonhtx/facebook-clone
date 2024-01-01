class SearchUser{
  final String id;
  final String username;
  final String avatar;
  final String created;
  final String same_friends;

  SearchUser({required this.id, required this.username, required this.avatar, required this.created, required this.same_friends});

  factory SearchUser.fromJson(Map<String, dynamic> json){
    return SearchUser(
        id: json['id'],
        username: json['username'],
        avatar: json['avatar'],
        created: json['created'],
        same_friends: json['same_friends']
    );
  }
}

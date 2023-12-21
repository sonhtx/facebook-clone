class NotificationUserData{
  final String id;
  final String username;
  final String avatar;

  NotificationUserData({required this.id, required this.username, required this.avatar});

  factory NotificationUserData.fromJson(Map<String, dynamic> json){
    return NotificationUserData(
        id: json['id'] as String,
        username: json['username'] as String,
        avatar: json['avatar'] as String,
    );
  }
}
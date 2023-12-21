class NotificationPostData{
  final String id;
  final String described;
  final String status;

  NotificationPostData({required this.id, required this.described, required this.status});

  factory NotificationPostData.fromJson(Map<String, dynamic> json){
    return NotificationPostData(
        id: json['id'] as String,
        described: json['described'] as String,
        status: json['status'] as String);
  }
}
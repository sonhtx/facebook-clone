class NotificationFeelData{
  final String feel_id;
  final String type;

  NotificationFeelData({required this.feel_id, required this.type});

  factory NotificationFeelData.fromJson(Map<String,dynamic>json){
    return NotificationFeelData(
        feel_id: json['feel_id'] as String,
        type: json['type'] as String);
  }
}
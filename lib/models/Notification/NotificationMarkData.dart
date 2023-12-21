class NotificationMarkData{
  final String mark_id;
  final String type_of_mark;
  final String mark_content;

  NotificationMarkData({required this.mark_id, required this.type_of_mark, required this.mark_content});

  factory NotificationMarkData.fromJson(Map<String, dynamic> json){
    return NotificationMarkData(
        mark_id: json['mark_id'] as String,
        type_of_mark: json['type_of_mark'] as String,
        mark_content: json['mark_content'] as String);
  }
}
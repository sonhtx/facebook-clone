class PushSettingsData {
  final String like_comment;
  final String from_friends;
  final String requested_friend;
  final String suggested_friend;
  final String birthday;
  final String video;
  final String report;
  final String sound_on;
  final String notification_on;
  final String vibrant_on;
  final String led_on;

  PushSettingsData(
      {required this.like_comment, required this.from_friends, required this.requested_friend, required this.suggested_friend, required this.birthday, required this.video, required this.report, required this.sound_on, required this.notification_on, required this.vibrant_on, required this.led_on});

  factory PushSettingsData.fromJson(Map<String, dynamic> json){
    return PushSettingsData(like_comment: json['like_comment'],
        from_friends: json['from_friends'],
        requested_friend: json['requested_friend'],
        suggested_friend: json['suggested_friend'],
        birthday: json['birthday'],
        video: json['video'],
        report: json['report'],
        sound_on: json['sound_on'],
        notification_on: json['notification_on'],
        vibrant_on: json['vibrant_on'],
        led_on: json['led_on']);
  }
}
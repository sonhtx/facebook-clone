class RequestSetNotification {

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

  RequestSetNotification(this.like_comment, this.from_friends, this.requested_friend, this.suggested_friend, this.birthday, this.video, this.report, this.sound_on, this.notification_on, this.vibrant_on, this.led_on);

  @override
  String toString() {
    return "like_comment: $from_friends: $from_friends,requested_friend: $requested_friend,suggested_friend:$suggested_friend,birthday: $birthday,video: $video,report: $report,sound_on: $sound_on,notification_on: $notification_on,vibrant_on: $vibrant_on,led_on: $led_on";
  }

  Map<String, dynamic> toJson() {
    return {
      "like_comment": like_comment,
      "from_friends": from_friends,
      "requested_friend": requested_friend,
      "suggested_friend": suggested_friend,
      "birthday": birthday,
      "video": video,
      "report": report,
      "sound_on": sound_on,
      "notification_on": notification_on,
      "vibrant_on": vibrant_on,
      "led_on": led_on
    };
  }
}

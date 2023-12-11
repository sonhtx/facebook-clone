class RequestListPost_VideoData {
  final String? user_id;
  final String in_campaign;
  final String campaign_id;
  final String latitude;
  final String longitude;
  final String last_id;
  final String index;
  final String count;

  RequestListPost_VideoData(this.user_id, this.in_campaign, this.campaign_id,
      this.latitude, this.longitude, this.last_id, this.index, this.count);

  Map<String, dynamic> toJson() {
    return {
      "user_id": user_id,
      "in_campaign": in_campaign,
      "campaign_id": campaign_id,
      "latitude": latitude,
      "longitude": longitude,
      "last_id": last_id,
      "index": index,
      "count": count
    };
  }
}

class RequestListNotification {

  final String index;
  final String count;

  RequestListNotification(this.index, this.count);

  Map<String, dynamic> toJson() {
    return {
      "index": index,
      "count": count
    };
  }
}

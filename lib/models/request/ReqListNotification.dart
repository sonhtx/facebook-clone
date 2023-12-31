class RequestListNotification {

  final String index;
  final String count;

  RequestListNotification(this.index, this.count);


  @override
  String toString() {
    return "index: ${index}, count: ${count} ";
  }

  Map<String, dynamic> toJson() {
    return {
      "index": index,
      "count": count
    };
  }
}

class RequestListBlock{
  final String index;
  final String count;

  RequestListBlock(this.index, this.count);

  Map<String, dynamic> toJson() {
    return {
      "index": index,
      "count": count
    };
  }
}
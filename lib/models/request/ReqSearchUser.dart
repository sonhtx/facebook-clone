class ReqSearchUser {
  final String keyword;
  final String index;
  final String count;

  ReqSearchUser(this.keyword,  this.index, this.count);

  Map<String, dynamic> toJson() {
    return {
      "keyword": keyword,
      "index": index,
      "count": count,
    };
  }
}

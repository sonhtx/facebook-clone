
class ReqSearch {

  final String keyword;
  final String user_id;
  final String index;
  final String count;

  ReqSearch(this.keyword, this.user_id, this.index, this.count);

  Map<String, dynamic> toJson() {
    return {
      "keyword" : keyword,
      "user_id" : user_id,
      "index" : index,
      "count" : count,
    };
  }
}
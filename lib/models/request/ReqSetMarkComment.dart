


class ReqSetMarkCmtData {
  final String id;
  final String content;
  final String index;
  final String count;
  final String mark_id;
  final String type;

  ReqSetMarkCmtData(
      this.id, this.content, this.index, this.count, this.mark_id, this.type);

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "content" : content,
      "index" : index,
      "count" : count,
      "mark_id" : mark_id,
      "type" : type
    };
  }
}
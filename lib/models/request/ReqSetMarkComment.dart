


class ReqSetMarkCmtData {
  final String id;
  final String content;
  final String index;
  final String count;
  late String mark_id;
  final String type;

  ReqSetMarkCmtData.withMarkId(
      this.id, this.content, this.index, this.count, this.mark_id, this.type);

  ReqSetMarkCmtData.withoutMarkId(
      this.id, this.content, this.index, this.count,  this.type);

  Map<String, dynamic> toJson1() {
    return {
      "id" : id,
      "content" : content,
      "index" : index,
      "count" : count,
      "mark_id" : mark_id,
      "type" : type
    };
  }
  Map<String, dynamic> toJson2() {
    return {
      "id" : id,
      "content" : content,
      "index" : index,
      "count" : count,
      "type" : type
    };
  }
}
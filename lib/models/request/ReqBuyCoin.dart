class RequestBuyCoin{
  final String code;
  final String coin;

  RequestBuyCoin(this.code, this.coin);

  Map<String, dynamic> toJson() {
    return {
      "index": code,
      "count": coin
    };
  }
}
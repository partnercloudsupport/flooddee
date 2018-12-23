class GetOrdersInput {
  String userId;
  int limit = 5;
  DateTime start;

  GetOrdersInput({this.userId, this.limit, this.start});
}

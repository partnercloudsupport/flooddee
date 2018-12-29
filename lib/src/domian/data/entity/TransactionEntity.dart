enum TransactionStatus { CHARGED, REFUNDED }

class TransactionEntity {
  String transactionId;
  String orderId;
  TransactionStatus status;
  int amount;
  DateTime createdAt;

  TransactionEntity.fromJson(Map<String, dynamic> data) {
    transactionId = data["transactionId"];
    orderId = data["orderId"];
    status = data["status"];
    amount = data["amount"];
    createdAt = data["createdAt"];
  }
}

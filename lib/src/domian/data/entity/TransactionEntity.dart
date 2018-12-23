
enum TransactionStatus {
  CHARGED,
  REFUNDED
}

class TransactionEntity {
  String transactionId;
  String orderId;
  TransactionStatus status;
  int amount;
  DateTime createdAt;
}

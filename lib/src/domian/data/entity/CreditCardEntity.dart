class CreditCardEntity {
  String type;
  String name;
  String cardNumber;
  String expired;
  String cvv;

  CreditCardEntity.fromJson(Map<String, dynamic> data) {
    this.type = data["type"];
    this.name = data["name"];
    this.cardNumber = data["cardNumber"];
    this.expired = data["expired"];
    this.cvv = data["cvv"];
  }

  CreditCardEntity(
      this.type, this.name, this.cardNumber, this.expired, this.cvv);
}

enum TypeTransaction {
  DEPOT,
  RETRAIT,
}

TypeTransaction getTypeTransaction(String type) =>
    TypeTransaction.values.firstWhere((element) => element.name == type);

String  getTypeTransactionString(TypeTransaction type) => type.name;

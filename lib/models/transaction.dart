class Transaction {
  final String id;
  final String titulo;
  final double valor;
  final DateTime data;

  Transaction(
      {required this.id,
      required this.titulo,
      required this.valor,
      required this.data});
}

class Statistics {
  final double upToDateEarnings;
  final double estimatedTotal;
  final List<ClientEarnings> clientEarnings;

  Statistics(
      {required this.upToDateEarnings,
      required this.estimatedTotal,
      required this.clientEarnings});
}

class ClientEarnings {
  final String clientName;
  final double earnings;
  final double percentage;

  ClientEarnings(
      {required this.clientName,
      required this.earnings,
      required this.percentage});
}

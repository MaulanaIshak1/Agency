import '../models/statistics.dart';

class StatisticsViewModel {
  Statistics getStatistics() {
    return Statistics(
      upToDateEarnings: 10500,
      estimatedTotal: 25958,
      clientEarnings: [
        ClientEarnings(
            clientName: "Gilbert P.", earnings: 8950, percentage: 34.5),
        ClientEarnings(
            clientName: "Richard B.", earnings: 7780, percentage: 29.9),
      ],
    );
  }
}

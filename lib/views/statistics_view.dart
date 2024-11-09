import 'package:agency_apk/models/statistics.dart';
import 'package:flutter/material.dart';
import '../viewmodels/statistics_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart'; // Add this package for pie chart

class StatisticsView extends StatelessWidget {
  final StatisticsViewModel viewModel = StatisticsViewModel();

  StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final statistics = viewModel.getStatistics();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: 'Bausch & Lomb',
              items: const [
                DropdownMenuItem(
                    value: "Bausch & Lomb", child: Text("Bausch & Lomb")),
                DropdownMenuItem(
                    value: "Praxair Inc", child: Text("Praxair Inc")),
              ],
              onChanged: (value) {
                // Handle agency selection
              },
            ),
            const SizedBox(height: 16),
            _buildUpToTodayCard(statistics.upToDateEarnings),
            const SizedBox(height: 16),
            _buildEstimatedTotalPieChart(statistics),
            const SizedBox(height: 16),
            _buildClientEarningsTable(statistics.clientEarnings),
          ],
        ),
      ),
    );
  }

  Widget _buildUpToTodayCard(double earnings) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Text(
            "\$${earnings.toStringAsFixed(0)}",
            style: const TextStyle(
                color: Colors.green, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "Up to Today",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildEstimatedTotalPieChart(Statistics statistics) {
    return Column(
      children: [
        Text(
          "\$${statistics.estimatedTotal.toStringAsFixed(0)}",
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "Est. Total",
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: PieChart(
            PieChartData(
              sections: statistics.clientEarnings.map((client) {
                return PieChartSectionData(
                  color: _getClientColor(client.clientName),
                  value: client.earnings,
                  title: '${client.percentage.toStringAsFixed(1)}%',
                  radius: 50,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 14),
                );
              }).toList(),
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildClientEarningsTable(List<ClientEarnings> clientEarnings) {
    return Expanded(
      child: ListView(
        children: clientEarnings.map((client) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _getClientColor(client.clientName),
              radius: 8,
            ),
            title: Text(
              client.clientName,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "\$${client.earnings.toStringAsFixed(0)}",
              style: TextStyle(color: Colors.grey[500]),
            ),
            trailing: Text(
              "${client.percentage.toStringAsFixed(1)}%",
              style: const TextStyle(color: Colors.orange),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getClientColor(String clientName) {
    // Assign a specific color to each client based on their name
    switch (clientName) {
      case "Gilbert P.":
        return Colors.blueAccent;
      case "Richard B.":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}

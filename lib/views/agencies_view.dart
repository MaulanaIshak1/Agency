import 'package:agency_apk/models/agency.dart' as agency_model;
import 'package:agency_apk/viewmodels/agency_viewmodels.dart';
import 'package:flutter/material.dart';

class AgenciesView extends StatelessWidget {
  final AgencyViewModel viewModel = AgencyViewModel();

  AgenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final agencies = viewModel.getAgencies();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agencies"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add new agency or task
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: agencies.length,
        itemBuilder: (context, index) {
          final agency = agencies[index];
          return AgencyCard(agency: agency);
        },
      ),
    );
  }
}

class AgencyCard extends StatelessWidget {
  final agency_model.Agency agency;

  const AgencyCard({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.apartment, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  agency.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: agency.tasks.map((task) {
                return TaskItem(task: task);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final agency_model.Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            color: task.title.contains("Test") ? Colors.blue : Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(color: Colors.grey[300], fontSize: 16),
                ),
                Text(
                  "\$${task.rate.toStringAsFixed(0)} ${task.type}",
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

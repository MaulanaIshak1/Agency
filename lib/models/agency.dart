class Agency {
  final String name;
  final List<Task> tasks;

  Agency({required this.name, required this.tasks});
}

class Task {
  final String title;
  final double rate;
  final String type; // 'hourly' or 'flat fee'

  Task({required this.title, required this.rate, required this.type});
}

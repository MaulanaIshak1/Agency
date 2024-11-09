import 'package:agency_apk/models/agency.dart';

class AgencyViewModel {
  // Sample data for agencies, which now correctly references Agency from models/agency.dart
  List<Agency> getAgencies() {
    return [
      Agency(
        name: 'Bausch & Lomb',
        tasks: [
          Task(title: 'Test preparation', rate: 150, type: 'per hour'),
          Task(title: 'Tutoring', rate: 375, type: 'flat fee'),
        ],
      ),
      Agency(
        name: 'Praxair Inc',
        tasks: [
          Task(title: 'Test preparation', rate: 100, type: 'per hour'),
          Task(title: 'Tutoring', rate: 95, type: 'flat fee'),
        ],
      ),
    ];
  }
}

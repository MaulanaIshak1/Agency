import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 11, 10): ['Math Tutoring', 'Physics Study Group'],
    DateTime.utc(2024, 11, 12): ['Chemistry Test Prep'],
    DateTime.utc(2024, 11, 15): ['AP Biology Review'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: Column(
        children: [
          _buildTableCalendar(),
          const SizedBox(height: 16),
          _buildEventList(),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(color: Colors.white),
        weekendTextStyle: TextStyle(color: Colors.redAccent),
        selectedDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        markerDecoration: BoxDecoration(
          color: Colors.greenAccent,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
      ),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.grey[400]),
        weekendStyle: const TextStyle(color: Colors.redAccent),
      ),
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          if (events.isNotEmpty) {
            return Positioned(
              right: 4,
              bottom: 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }
          return null;
        },
      ),
      eventLoader: (day) {
        return _events[day] ?? [];
      },
    );
  }

  Widget _buildEventList() {
    final selectedEvents = _events[_selectedDay] ?? [];

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.grey[850],
        child: selectedEvents.isEmpty
            ? Center(
                child: Text(
                  'No events for this day',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              )
            : ListView.builder(
                itemCount: selectedEvents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.event, color: Colors.orange),
                    title: Text(
                      selectedEvents[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

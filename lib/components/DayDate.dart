import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayDate extends StatefulWidget {
  const DayDate({super.key});

  @override
  State<DayDate> createState() => _DayDate();
}

class _DayDate extends State<DayDate> {
  // date time object for dynamic date month, day
  late DateTime _selectedDate;
  late List<DateTime> _currentWeekDays;

  @override
  void initState() {
    super.initState();
    // 1. Initialize selected date as today
    _selectedDate = DateTime.now();
    // 2. Calculate all 7 days of the current active week
    _generateCurrentWeek();
  }

  void _generateCurrentWeek() {
    final DateTime now = DateTime.now();
    // Find Monday of the current week (DateTime weekday: 1 = Monday, 7 = Sunday)
    final int daysToSubtract = now.weekday - 1;
    final DateTime monday = now.subtract(Duration(days: daysToSubtract));

    // Generate the 7 consecutive days starting from Monday
    _currentWeekDays = List.generate(7, (index) {
      return monday.add(Duration(days: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _currentWeekDays.map((date) {
          // Format structural labels dynamically
          final String dayLabel = DateFormat(
            'E',
          ).format(date); // Mon, Tue, Wed...
          final String dateLabel = DateFormat('d').format(date); // 1, 2, 3...

          // Check if this date item matches the user's currently selected date
          final bool isSelected = DateUtils.isSameDay(date, _selectedDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate =
                    date; // Instantly updates and re-renders active layout
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Dynamic Short Weekday Label (e.g., "Mon")
                Text(
                  dayLabel,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 13.0,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? const Color(0xFF25170B)
                        : const Color(0xFF9E9E9E),
                  ),
                ),

                const SizedBox(height: 12.0),

                // 2. Dynamic Circle Date Badge Selection Overlay
                Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? const Color(0xFF25170B) : Colors.white,
                    boxShadow: !isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      dateLabel,
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15.0,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF25170B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayDate extends StatefulWidget {
  const DayDate({super.key});

  @override
  State<DayDate> createState() => _DayDate();
}

class _DayDate extends State<DayDate> {
  late DateTime _selectedDate;
  late List<DateTime> _currentWeekDays;

  // initial state for day date
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _generateCurrentWeek();
  }

  // generates 7 current week days and there dates for ui
  void _generateCurrentWeek() {
    final DateTime now = DateTime.now();
    final int daysToSubtract = now.weekday - 1;
    final DateTime monday = now.subtract(Duration(days: daysToSubtract));

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
          final String dayLabel = DateFormat(
            'E',
          ).format(date); // Mon, Tue, Wed...
          final String dateLabel = DateFormat('d').format(date);

          final bool isSelected = DateUtils.isSameDay(date, _selectedDate);

          return GestureDetector(
            // update UI 
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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

                // UI for week day and date only list of 7
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

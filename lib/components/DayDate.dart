import 'package:flutter/material.dart';

class DayDate extends StatefulWidget {
  const DayDate({super.key});

  @override
  State<DayDate> createState() => _DayDate();
}

class _DayDate extends State<DayDate> {
  final List<Map<String, dynamic>> weekDays = [
    {'day': 'Mon', 'date': '7', 'isSelected': false},
    {'day': 'Tue', 'date': '8', 'isSelected': false},
    {'day': 'Wed', 'date': '9', 'isSelected': false},
    {'day': 'Thu', 'date': '10', 'isSelected': false},
    {'day': 'Fri', 'date': '11', 'isSelected': false},
    {'day': 'Sat', 'date': '12', 'isSelected': false},
    {'day': 'Sun', 'date': '13', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekDays.map((item) {
          final bool selected = item['isSelected'];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Day Label Text (Mon, Tue, Wed...)
              Text(
                item['day'],
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 13.0,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  color: selected
                      ? const Color(0xFF25170B)
                      : const Color(0xFF9E9E9E),
                ),
              ),

              const SizedBox(height: 12.0), // Padding gap matching UI spacing
              // 2. Circular Date Badge Container
              InkWell(
                child: Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? const Color(0xFF25170B)
                        : Colors.white, // Active dark fill or white background
                    boxShadow: !selected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: 0.03,
                              ), // Soft elevation for inactive days
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      item['date'],
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15.0,
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.w600,
                        color: selected
                            ? Colors.white
                            : const Color(0xFF25170B),
                      ),
                    ),
                  ),
                ),
                onTap: () => {
                  setState(() {
                    if (item['isSelected'] == false) {
                      item['isSelected'] = true;
                    } else {
                      item['isSelected'] = false;
                    }
                  }),
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

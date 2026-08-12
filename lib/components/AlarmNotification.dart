import 'package:flutter/material.dart';

class AlarmNotification extends StatefulWidget {
  const AlarmNotification({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmNotification();
}

class _AlarmNotification extends State<AlarmNotification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 380,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6D5), 
              borderRadius: BorderRadius.circular(24), 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Set the reminder',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5E2A12), 
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Never miss your morning routine!\nSet a reminder to stay on track',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9E6548), 
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF5E2A12,
                    ),
                    foregroundColor: Colors.white, 
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Set Now',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 12,
            bottom: 12,
            top: 12,
            child: Image.asset(
              'assets/image/bell.png',
              fit: BoxFit.contain,
              width: 110, 
            ),
          ),
        ],
      ),
    );
  }
}

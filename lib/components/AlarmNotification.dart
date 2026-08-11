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
      height: 150,
      width: 380,
      child: Container(
        height: 150,
        width: 380,
        decoration: BoxDecoration(
          color: const Color.fromARGB(134, 255, 172, 64),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 150),
              child: Text(
                "Set the reminder",
                style: TextStyle(
                  fontFamily: "ComicSansCustom",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 120, top: 5),
              child: Text(
                "Never miss your morning routine!\nSet a reminder to stay on track",
                style: TextStyle(fontFamily: "ComicSansCustom"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240, top: 7),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25170B),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => {},
                child: Text("Set Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

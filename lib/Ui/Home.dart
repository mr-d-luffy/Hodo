import 'package:flutter/material.dart';
import 'package:hodo/components/DayDate.dart';
import 'package:intl/intl.dart';
import 'package:hodo/components/AlarmNotification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String name = "Mohit";

    // date time object for dynamic date month, day
    DateTime now = DateTime.now();
    String weekday = DateFormat('EEEE').format(now);
    String dayMonthYear = DateFormat('d MMMM, yyyy').format(now).toLowerCase();
    String formattedCurrentDate = '$weekday. $dayMonthYear';

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 45.0,
                      left: 15.0,
                      right: 0,
                    ),
                    child: Text(
                      "Morning, $name",
                      style: TextStyle(
                        fontFamily: "ComicSansCustom",
                        fontWeight: FontWeight.w600,
                        fontSize: 32.0,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                const SizedBox(width: 16.0),

                // profile icon image
                Padding(
                  padding: const EdgeInsets.only(top: 60, right: 15),
                  child: CircleAvatar(
                    radius: 28.0,
                    backgroundColor: const Color(0xFFFDECD8),
                    backgroundImage: const AssetImage(
                      'assets/image/lion_avatar.png',
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(right: 230),
              child: Text(
                "$formattedCurrentDate",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'PlusJakartaSans',
                  letterSpacing: -0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // week day and month number list of 7 monday to sunday
                  DayDate(),
                  // reminder notification banner Ui component
                  AlarmNotification(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 300),
              child: FloatingActionButton(
                onPressed: () => {
                  setState(() {
                    // code for floting action button of todo
                  })
                },
                shape: const CircleBorder(),
                backgroundColor: Color(0xFF5E2A12),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

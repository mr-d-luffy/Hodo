import 'package:flutter/material.dart';
import 'Ui/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // this is the root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HODO',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color(0xFF9E6548)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: const Color.fromARGB(118, 255, 114, 7),
          ),
          child: Text(
            "HODO",
            style: TextStyle(
              fontSize: 75,
              color: Colors.black,
              fontFamily: "Certificate",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

// lib/models/college.dart
import 'package:flutter/material.dart';

class College {
  final String name;
  final String? motto; // In case we want to add a college-specific motto later

  College({required this.name, this.motto});
}

// A static list to represent the data from the image
final List<College> grcColleges = [
  College(name: 'COLLEGE OF BUSINESS ADMINISTRATION'),
  College(name: 'COLLEGE OF ACCOUNTANCY'),
  College(name: 'COLLEGE OF COMPUTER STUDIES'),
  College(name: 'COLLEGE OF EDUCATION'),
];


// lib/main.dart

void main() {
  runApp(const GrcApp());
}

class GrcApp extends StatelessWidget {
  const GrcApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Global Reciprocal Colleges',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const GrcHomeScreen(),
    );
  }
}

class GrcHomeScreen extends StatelessWidget {
  const GrcHomeScreen({super.key});

  // The primary color from the image is a reddish-maroon.
  static const Color grcRed = Color(0xFFC74343);

  // The motto from the image
  static const String grcMotto = 'TOUCHING HEARTS, RENEWING MINDS, TRANSFORMING LIVES';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- HEADER SECTION (Red Background) ---
            Container(
              padding: const EdgeInsets.only(top: 60, bottom: 40, left: 20, right: 20),
              color: grcRed,
              child: Column(
                children: <Widget>[
                  // GRC Logo text - (Assuming a simple text logo for now)
                  const Text(
                    'Global Reciprocal\nColleges',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Main Institution Name
                  const Text(
                    'GLOBAL RECIPROCAL COLLEGES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Institution Motto
                  const Text(
                    grcMotto,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            // --- COLLEGES LIST SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: Column(
                children: grcColleges.map((college) {
                  return CollegeTile(name: college.name);
                }).toList(),
              ),
            ),

            // Placeholder for the College Logos (Optional)
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: Text(
                  'MISSION\nGRC is creating a culture for successful, socially responsible, morally upright skilled workers and highly competent professionals through values-based quality education.\n\n\nVISION\nA global community of excellent individuals with values.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget for displaying each college name clearly
class CollegeTile extends StatelessWidget {
  final String name;

  const CollegeTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 20.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!, // A subtle separator line
          ),
        ),
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
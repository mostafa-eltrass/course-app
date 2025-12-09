import 'package:flutter/material.dart';

class Course {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  Course({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
final List<Course> courses = [
  Course(
    title: "Flutter Mastery",
    description: "Learn Flutter from scratch and build apps.",
    icon: Icons.phone_android,
    color: Colors.blueAccent,
  ),
  Course(
    title: "React Native for Beginners",
    description: "Build mobile apps using React Native.",
    icon: Icons.phone_iphone,
    color: Colors.greenAccent,
  ),
  Course(
    title: "UI/UX Design",
    description: "Design beautiful and user-friendly interfaces.",
    icon: Icons.design_services,
    color: Colors.orangeAccent,
  ),
  Course(
    title: "Dart Basics",
    description: "Learn Dart programming language fundamentals.",
    icon: Icons.code,
    color: Colors.purpleAccent,
  ),
];

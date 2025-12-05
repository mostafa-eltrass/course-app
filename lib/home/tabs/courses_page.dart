import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
        centerTitle: true,
      ),
      body: Center(child: Text("All Courses Here")),
    );
  }
}
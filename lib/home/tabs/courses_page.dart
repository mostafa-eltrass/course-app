import 'package:course_app/home/tabs/widgets/course_card.dart';
import 'package:course_app/home/tabs/widgets/course_model.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() =>  CoursesPageState();
}

class CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> gradientAnimation;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat(reverse: true);

    gradientAnimation = ColorTween(
      begin: Colors.purpleAccent,
      end: Colors.blueAccent,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: gradientAnimation,
      builder: (context, child) {
        final gradientColor = gradientAnimation.value ?? Colors.purpleAccent;
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Courses",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    gradientColor,
                    Colors.deepPurpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientColor,
                  Colors.deepPurpleAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return CourseCard(
                  course: course,
                  onTap: () {
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => MyCoursesPageState();
}

class MyCoursesPageState extends State<MyCoursesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> gradientAnimation;

  final List<Map<String, String>> courses = [
    {"title": "Flutter Development", "subtitle": "122 Lessons"},
    {"title": "UI/UX Design", "subtitle": "80 Lessons"},
    {"title": "Python Programming", "subtitle": "25 Lessons"},
    {"title": "Digital Marketing", "subtitle": "43 Lessons"},
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    controller.repeat(reverse: true);
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
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "My Courses",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: gradientAnimation.value,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.white, // أي أيقونات في الاب بار أبيض
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientAnimation.value ?? Colors.purpleAccent,
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
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        child: const Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              course["subtitle"]!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

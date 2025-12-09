import 'package:course_app/home/tabs/widgets/course_notification.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _gradientAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 8))
      ..repeat(reverse: true);

    _gradientAnimation = ColorTween(
      begin: Colors.purpleAccent,
      end: Colors.blueAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gradientAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _gradientAnimation.value ?? Colors.purpleAccent,
                  Colors.deepPurpleAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: const Text(
                      "  Notifications",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        courseNotification(
                          icon: Icons.play_circle_fill,
                          color: Colors.blue,
                          title: "New Lesson Available",
                          subtitle:
                          "A new lesson has been added to Flutter Mastery.",
                          time: "Just now",
                        ),
                        courseNotification(
                          icon: Icons.book_online,
                          color: Colors.green,
                          title: "New Course Released",
                          subtitle: "React Native for Beginners is now live!",
                          time: "10 min ago",
                        ),
                        courseNotification(
                          icon: Icons.update,
                          color: Colors.orange,
                          title: "Course Progress Reminder",
                          subtitle: "Continue your progress in UI/UX Design.",
                          time: "1 hour ago",
                        ),
                        courseNotification(
                          icon: Icons.workspace_premium,
                          color: Colors.purple,
                          title: "Certificate Ready",
                          subtitle: "Your certificate for Dart Basics is available.",
                          time: "3 hours ago",
                        ),
                        courseNotification(
                          icon: Icons.discount,
                          color: Colors.red,
                          title: "Course Discount",
                          subtitle: "🔥 50% off on Advanced Flutter for 24 hrs!",
                          time: "Today",
                        ),
                        courseNotification(
                          icon: Icons.person,
                          color: Colors.teal,
                          title: "Instructor Message",
                          subtitle: "Your instructor sent feedback on your task.",
                          time: "Yesterday",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

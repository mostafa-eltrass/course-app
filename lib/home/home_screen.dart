import 'package:course_app/home/tabs/categories_page.dart';
import 'package:course_app/home/tabs/courses_page.dart';
import 'package:course_app/home/tabs/myCourses_page.dart';
import 'package:course_app/home/tabs/notification_page.dart';
import 'package:course_app/home/tabs/profile_page.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  State<HomeScreen> createState() =>  HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late AnimationController controller;
  late Animation<Color?> gradientAnimation;

  final List<Widget> pages = [
    CoursesPage(),
    CategoriesPage(),
    MyCoursesPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);

    gradientAnimation = ColorTween(
      begin: Colors.deepPurple,
      end: Colors.purpleAccent,
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
        Color bgColor = gradientAnimation.value ?? Colors.deepPurple;

        return Scaffold(
          backgroundColor: Colors.transparent, // خلي الشاشه الأساسية شفافه
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [bgColor, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: pages[currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, // شفاف عشان يشوف gradient
            elevation: 0,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill),
                label: "My Courses",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Alerts",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}

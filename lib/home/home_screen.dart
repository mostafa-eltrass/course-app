import 'package:course_app/home/tabs/categories_page.dart';
import 'package:course_app/home/tabs/courses_page.dart';
import 'package:course_app/home/tabs/myCourses_page.dart';
import 'package:course_app/home/tabs/notification_page.dart';
import 'package:course_app/home/tabs/profile_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    CoursesPage(),
    CategoriesPage(),
    MyCoursesPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0066FF),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,

          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,

          showUnselectedLabels: false,
          showSelectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school,
                size: currentIndex == 0 ? 30 : 24,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: currentIndex == 1 ? 30 : 24,
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_fill,
                size: currentIndex == 2 ? 30 : 24,
              ),
              label: "My Courses",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: currentIndex == 3 ? 30 : 24,
              ),
              label: "Alerts",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: currentIndex == 4 ? 30 : 24,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

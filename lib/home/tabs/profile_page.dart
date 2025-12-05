import 'dart:ui';
import 'package:course_app/home/tabs/widgets/profile_card.dart';
import 'package:course_app/home/tabs/widgets/small_button.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Halo Glow
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 40,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          ),
                          // Profile picture with halo
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const CircleAvatar(
                              radius: 55,
                              backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Mostafa Eltrass",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "mostafa@email.com",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SmallButton(icon: Icons.edit, title: "Edit Profile"),
                        SizedBox(width: 15),
                        SmallButton(icon: Icons.settings, title: "Settings"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Glassmorphic Cards
                    ProfileCard(
                      icon: Icons.play_circle_fill,
                      title: "My Courses",
                      subtitle: "12 Courses Enrolled",
                      color: Colors.orangeAccent,
                    ),
                    ProfileCard(
                      icon: Icons.favorite,
                      title: "Wishlist",
                      subtitle: "8 Saved Courses",
                      color: Colors.pinkAccent,
                    ),
                    ProfileCard(
                      icon: Icons.notifications,
                      title: "Notifications",
                      subtitle: "Manage Alerts",
                      color: Colors.greenAccent,
                    ),
                    ProfileCard(
                      icon: Icons.logout,
                      title: "Logout",
                      subtitle: "Sign out from app",
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white.withOpacity(0.3),
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        );
      },
    );
  }
}

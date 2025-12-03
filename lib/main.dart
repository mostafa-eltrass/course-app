import 'package:course_app/auth/sign_in.dart';
import 'package:course_app/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding/onboarding_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: SignIn.id,
      routes: {

        "OnBoardingScreen": (context) => OnBoardingScreen(),
        "HomeScreen": (context) =>   MyHomePage(title: "Home"),
        WelcomeScreen.id :(context) => WelcomeScreen(),
        SignIn.id :(context) => SignIn()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text("Welcome To Home Screen!")),
    );
  }
}

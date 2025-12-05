import 'package:course_app/auth/sign_in.dart';
import 'package:course_app/auth/sign_up.dart';
import 'package:course_app/home/home_screen.dart';
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
      initialRoute: HomeScreen.id,
      routes: {

         OnBoardingScreen.id : (context) => OnBoardingScreen(),
        HomeScreen.id: (context) =>   HomeScreen(),
        WelcomeScreen.id :(context) => WelcomeScreen(),
        SignUp.id :(context) => SignUp(),
        SignIn.id :(context) => SignIn()
      },
    );
  }
}



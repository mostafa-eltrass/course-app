import 'package:course_app/auth/sign_in.dart';
import 'package:course_app/auth/sign_up.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  @override
   WelcomeScreenState createState() =>  WelcomeScreenState();
}
class  WelcomeScreenState extends State<WelcomeScreen> {
  String selectedButton = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.4),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = "signup";
                    });
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor:
                    selectedButton == "signup"
                        ? Colors.white
                        : Colors.transparent,
                    foregroundColor:
                    selectedButton == "signup"
                        ? Colors.black
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedButton = "signin";
                    });
                    Navigator.pushNamed(context, SignIn.id);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),

                    backgroundColor:
                    selectedButton == "signin"
                        ? Colors.white
                        : Colors.transparent,

                    side: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedButton == "signin"
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

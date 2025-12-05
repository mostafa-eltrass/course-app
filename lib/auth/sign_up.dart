import 'package:course_app/auth/sign_in.dart';
import 'package:course_app/auth/widget/custom_text_field.dart';
import 'package:course_app/auth/widget/custombutton.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String id = "SignUn";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFCFC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.PNG"),
              SizedBox(height: 15),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,SignIn.id);
                    },
                    child: Text('Sign In', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Full Name'),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Email'),
              SizedBox(height: 15),
              CustomTextField(hintText: 'Password', isPassword: true),
              SizedBox(height: 25),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: Icon(
                    Icons.g_mobiledata,
                    color: Colors.red,
                    size: 50,
                  ),
                  label: Text('Sign in with Google'),
                ),
              ),
              SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white ,
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 30,
                  ),
                  label: Text('Sign in with Facebook'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

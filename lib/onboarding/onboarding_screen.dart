import 'package:course_app/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = "OnBoardingScreen";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: "assets/images/onboarding1.jpeg",
      title: "Flexible Hours",
      desc: "Burger is simply dummy text of the printing and typesetting industry.",
    ),
    OnBoardingModel(
      image: "assets/images/onboarding2.png",
      title: "Great Earnings",
      desc: "Burger has been the industry's standard dummy text ever since.",
    ),
    OnBoardingModel(
      image: "assets/images/onboarding3.png",
      title: "Be Your Own Boss",
      desc: "Lorem Ipsum has been the industry's standard dummy text ever since.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(
                          pages[index].image,
                          height: MediaQuery.of(context).size.height * 0.60,
                          fit: BoxFit.cover,
                        ),

                        const SizedBox(height: 20),
                        Text(
                          pages[index].title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pages[index].desc,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      pages.length,
                          (index) => GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.all(4),
                          width: currentIndex == index ? 16 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  currentIndex == pages.length - 1
                      ? ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool("seenOnboarding", true);

                      Navigator.pushReplacementNamed(context,  WelcomeScreen.id );
                    },
                    child: Text("GET STARTED",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    ),
                  )
                      : TextButton(

                    onPressed: () {
                      Navigator.pushReplacementNamed(context,  WelcomeScreen.id);
                    },
                    child: Text(
                      "SKIP",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

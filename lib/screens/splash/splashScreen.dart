import 'package:college_hearts/common/components/buttonDesign.dart';
import 'package:college_hearts/screens/login/loginScreen.dart';
import 'package:college_hearts/screens/login/signupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _current = 0;
  CarouselSliderController carouselController = CarouselSliderController();
  final List<Map<String, String>> onboardingCarousel = [
    {
      "title": "Algorithm",
      "image": 'assets/carousel/girl1.png',
      "desc":
          "Users going through a vetting process \nto ensure you never match with bots."
    },
    {
      "title": "Matches",
      "image": 'assets/carousel/girl2.png',
      "desc":
          "We match you with people that have \na large array of similar interests."
    },
    {
      "title": "Premium",
      "image": 'assets/carousel/girl3.png',
      "desc":
          "Sign up today and enjoy the first month \nof premium benefits on us."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.65,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.7,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  itemCount: onboardingCarousel.length,
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    final carouselItem = onboardingCarousel[itemIndex];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.4,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(carouselItem['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          carouselItem['title']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color(0xffe94057)),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            carouselItem['desc']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: onboardingCarousel.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () =>
                          carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? const Color(0xffe94057).withOpacity(0.9)
                              : const Color(0xffe94057).withOpacity(0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const MainButtonDesign(text: "Create an Account"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xffe94057)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
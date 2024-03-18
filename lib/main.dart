import 'package:flutter/material.dart';
import 'package:meal_planner/screens/add_new_meal_page.dart';
import 'package:meal_planner/screens/details_page.dart';
import 'package:meal_planner/screens/home_page.dart';
import 'package:meal_planner/screens/login_page.dart';
import 'package:meal_planner/screens/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meal Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        "HomePage" : (context) => const MyHomePage(),
        "LoginPage" : (context) => const LoginPage(),
        "SignupPage" : (context) => const SignUpPage(),
        "DetailsPage" : (context) => const DetailsPage(),
        "AddNewMealPage" : (context) => const AddNewMealPage(),
      },
    );
  }
}

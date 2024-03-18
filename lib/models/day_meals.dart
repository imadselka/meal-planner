import 'package:meal_planner/models/meal.dart';

class DayMeals {
  String day;
  List<Meal> listOfMeals;
  
  DayMeals({required this.day, required this.listOfMeals});
}
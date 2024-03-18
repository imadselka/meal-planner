import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/models/meal.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final receivedData = ModalRoute.of(context)?.settings.arguments as DayMeals;
    List<Meal> myListOfMeals = receivedData.listOfMeals;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: myListOfMeals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 90, child: Image.asset(myListOfMeals[index].imagePath),),
                Flexible(
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    myListOfMeals[index].name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
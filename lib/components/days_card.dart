import 'package:flutter/material.dart';
import 'package:meal_planner/models/day_meals.dart';
import 'package:meal_planner/models/meal.dart';

class DayCard extends StatelessWidget {
  final DayMeals dayAndItsMealsList;
  const DayCard({super.key, required this.dayAndItsMealsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 90,
        padding: const EdgeInsets.only(right: 40,left: 30,top: 20,),
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black,width: 1),
            bottom: BorderSide(color: Colors.black,width: 1),
            right: BorderSide(color: Colors.black,width: 1),
            left: BorderSide(color: Colors.black,width: 1),
          ),
          color: Color.fromARGB(255, 91, 163, 222),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                dayAndItsMealsList.day,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, 'DetailsPage',arguments: dayAndItsMealsList,),
                  child: const Icon(
                    Icons.visibility,
                    size: 30,
                    color: Colors.black12,
                  ),
                ),
                const SizedBox(width: 20,),
                InkWell(
                  onTap: ()async{
                    try{
                      Meal meal = await Navigator.pushNamed(context, 'AddNewMealPage') as Meal;
                      dayAndItsMealsList.listOfMeals.add(meal);
                    }catch(e){}
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
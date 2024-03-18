import 'package:flutter/material.dart';
import 'package:meal_planner/components/days_card.dart';
import 'package:meal_planner/models/day_meals.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  final List<DayMeals> dayList = [DayMeals(day: "Sunday", listOfMeals:[]),DayMeals(day: "Monday", listOfMeals:[]),DayMeals(day: "Tuesday", listOfMeals:[]),DayMeals(day: "Wednesday", listOfMeals:[]),DayMeals(day: "Thursday", listOfMeals:[]),DayMeals(day: "Friday", listOfMeals:[]),DayMeals(day: "Saturday", listOfMeals:[])];
  final ScrollController _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: dayList.length,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DayCard(dayAndItsMealsList: dayList[index]),
          );
        },
      ),
    );
  }
}
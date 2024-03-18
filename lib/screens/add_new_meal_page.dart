import 'package:flutter/material.dart';
import 'package:meal_planner/components/my_button.dart';
import 'package:meal_planner/components/my_textfield.dart';
import 'package:meal_planner/models/meal.dart';

class AddNewMealPage extends StatefulWidget {
  const AddNewMealPage({super.key});

  @override
  State<AddNewMealPage> createState() => _AddNewMealPageState();
}

class _AddNewMealPageState extends State<AddNewMealPage> {

  List<MyTextField> listOfMyTextField = [];

  Meal? meal;

  final GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  final TextEditingController _mealNameController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Meal",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: myFormState,
              child: Column(
                children: [
                  MyTextField(
                    myHintText: "Enter Meals Name",
                    myIcon: const Icon(Icons.restaurant_menu),
                    isObscure: false,
                    myController: _mealNameController,
                    myValidator: myValidateEmptyFieldFct,
                  ),
                  const SizedBox(height: 20,),
                  MyTextField(
                    myHintText: "Enter Image Path",
                    myIcon: const Icon(Icons.image),
                    isObscure: false,
                    myController: _imagePathController,
                    myValidator: myValidateEmptyFieldFct,
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 1),
                    ),
                    child: Card(
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10,),
                              const Text(
                                "List Of Ingredients",
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),
                              ),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    if(listOfMyTextField.isNotEmpty){
                                      listOfMyTextField.remove(listOfMyTextField.last);
                                    }
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    listOfMyTextField.add(MyTextField(myHintText: 'Ingrediant Name', myIcon: const ImageIcon(AssetImage("images/vegetable.png")), isObscure: false, myValidator: myValidateEmptyFieldFct, myController: TextEditingController(),));
                                  });
                                },
                                icon: const Icon(Icons.add)
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: listOfMyTextField.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    listOfMyTextField[index],
                                    const SizedBox(height: 10,),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  MyButton(
                    myButtonLabel: "Add The Meal",
                    myOnpressedFct: listOfMyTextField.isEmpty ? null : addMealFct,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? myValidateEmptyFieldFct(String? value){
    return value!.isEmpty
    ? "This Field Can't be empty"
    : null;
  }

  void addMealFct(){
    if(myFormState.currentState!.validate()){
      List<String> listOfIngredient = [];

      for(MyTextField e in listOfMyTextField){
        listOfIngredient.add(e.myController!.text);
      }

      meal = Meal(
        name: _mealNameController.text,
        imagePath: _imagePathController.text,
        listOfIngredient: listOfIngredient,
      );

      Navigator.pop(context,meal);
    }
  }
}
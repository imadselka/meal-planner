import 'package:flutter/material.dart';
import 'package:meal_planner/components/my_button.dart';
import 'package:meal_planner/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(right: 15,left: 15,top: 80,bottom: 5),
          child: Form(
            key: myFormState,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Welcome To My App",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/logo.jpg"),
                    radius: 70,
                  ),
                ),
                MyTextField(
                  myHintText: "Username",
                  myIcon: const Icon(Icons.person),
                  isObscure: false,
                  myController: _usernameController,
                ),
                const SizedBox(height: 20,),
                MyTextField(
                  myHintText: "Password",
                  myIcon: const Icon(Icons.lock),
                  isObscure: true,
                  myController: _passwordController,
                ),
                const SizedBox(height: 20,),
                MyButton(
                  myButtonLabel: "Login",
                  myOnpressedFct: (){
                    if(myFormState.currentState!.validate()){
                      Navigator.pushNamed(context, "HomePage");
                    }
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 30),
                  child: MyTextButton(myButtonLabel: "Forgot Your Password?",myOnpressedFct: (){},),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have An Account?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    MyTextButton(
                      myButtonLabel: "Sign Up",
                      myOnpressedFct: (){
                        Navigator.pushReplacementNamed(context, "SignupPage");
                      },
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
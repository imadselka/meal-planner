import 'package:flutter/material.dart';
import 'package:meal_planner/components/my_button.dart';
import 'package:meal_planner/components/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final GlobalKey<FormState> myFormState = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 50),
                  child:  Center(
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 96, 94, 94),
                        fontSize: 20,
                      ),
                    ),
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
                  myHintText: "Email",
                  myIcon: const Icon(Icons.email),
                  isObscure: false,
                  myController: _emailController,
                  myValidator: myValidateEmailFct,
                ),
                const SizedBox(height: 20,),
                MyTextField(
                  myHintText: "Password",
                  myIcon: const Icon(Icons.lock),
                  isObscure: true,
                  myController: _passwordController,
                  myValidator: myValidatePwdFct,
                ),
                const SizedBox(height: 20,),
                MyTextField(
                  myHintText: "Confirm Password",
                  myIcon: const Icon(Icons.lock),
                  isObscure: true,
                  myController: _confirmPasswordController,
                  myValidator: myValidateConfirmPwdFct,
                ),
                const SizedBox(height: 20,),
                MyButton(
                  myButtonLabel: "Sign Up",
                  myOnpressedFct: (){
                    if(myFormState.currentState!.validate()){}
                  },
                ),
                Container(
                  height: 70,
                  width: 500,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: const Center(
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                MyButton(myButtonLabel: "Sign In With Google", myOnpressedFct: (){}),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 70,
                    width: 500,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have An Account?",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        MyTextButton(
                          myButtonLabel: "Login",
                          myOnpressedFct: (){
                            Navigator.pushReplacementNamed(context, "LoginPage");
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? myValidateEmailFct(String? value){ 

    const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    final regex = RegExp(pattern); 

    return value!.isEmpty
    ? "Email Can't be empty"
    : !regex.hasMatch(value)
    ? 'Enter a valid email address'
    : null;
  }

  String? myValidatePwdFct(String? value){ 

    const pattern =r'^(?=.*[A-Z])(?=.*?[0-9])(?=.*?[ @#\&*~]) .{8,}'; 

    final regex = RegExp(pattern); 

    return value!.isEmpty
    ? "Password Can't be empty"
    : !regex.hasMatch(value)
    ? 'The password must be at least 8 characters \n and should contain at least one upper case, \n one digit, one special character among (@#&*~)'
    : null;
  }

  String? myValidateConfirmPwdFct(String? value){
    return value!.isEmpty
    ? "Password Can't be empty"
    : value != _passwordController.text
    ? 'The Value Entered Is Different From Password'
    : null;
  }
}
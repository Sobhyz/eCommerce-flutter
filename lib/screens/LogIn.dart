
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/screens/Register.dart';
import 'package:task3/screens/homescreen.dart';
import 'package:task3/services/auth.dart';
import '../widgets/formField.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    Auth _auth = Auth();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFormField(controller: emailC, hintText: "email"),
                MyFormField(controller: passwordC, hintText: "Password"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          UserCredential usr = await _auth.Login(emailC.text,passwordC.text);
                          if(usr != null){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),(route) => false);
                          }
                        },
                        child: const Text("SignIn")
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: () async{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: const Text("Sign Up")
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

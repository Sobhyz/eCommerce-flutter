import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/screens/LogIn.dart';
import 'package:task3/screens/homescreen.dart';
import 'package:task3/services/auth.dart';
import 'package:task3/widgets/formField.dart';

class Register extends StatelessWidget {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController namedC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Register({Key? key}) : super(key: key);
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyFormField(controller: emailC, hintText: "email"),
                MyFormField(controller: passwordC, hintText: "Password"),
                MyFormField(controller: namedC, hintText: "name"),
                MyFormField(controller: phoneC, hintText: "phone"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          UserCredential usr = await _auth.SignInCredentials(emailC.text,passwordC.text);
                          if(usr != null){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()),(route) => false);
                          }
                    },
                        child: const Text("Register")
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: () async{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text("Sign In")
                    )
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

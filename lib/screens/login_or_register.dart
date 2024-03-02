import "package:flutter/material.dart";
import "package:freeflow/screens/login_screen.dart";
import "register_screen.dart";

//this file checks if we should show the login screen, or the register screen
class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  bool showLoginPage = true;

  void togglePages(){
    setState((){
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegisterPage(onTap: togglePages,);
    }
  }
}
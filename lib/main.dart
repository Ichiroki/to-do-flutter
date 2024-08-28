import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/Pages/home.dart';
import 'package:to_do_list_flutter/Pages/loading.dart';
import 'package:to_do_list_flutter/Pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main () async {
  return runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => const Loading(),
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
    }
  ));
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}

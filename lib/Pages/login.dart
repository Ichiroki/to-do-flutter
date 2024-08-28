import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void getUser() async {
    try {
      final res = http.post(Uri.parse('http://localhost:3000/api/login'), 
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        },
      )).then((value) {
        final Map<String, dynamic> responsedata = jsonDecode(value.body);
        print(responsedata);
        if(value.statusCode == 201) {
          print('login success: $responsedata');
        } else {
          print('login failed');
        }
      });

      return res;
    } catch(e) {
      print('Internal server error, please wait : $e');
      // return http.Response('Internal server error, please wait : $e', 500);
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(children: <Widget>[
            const Text('Login', style: TextStyle(fontSize: 24),),
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password'
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: getUser, child: const Text('Login'))
          ],),
        ),
      ),
    );
  }
}
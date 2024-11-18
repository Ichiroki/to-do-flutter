import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/API/userAPI.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailValue = TextEditingController();
  final passwordValue = TextEditingController();
  final usernameValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(children: [
            const Text(
                'Register', 
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(10), 
                child: TextFormField(
                  controller: emailValue,
                  decoration: const InputDecoration(
                    label: Text('Email')
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10), 
                child: TextFormField(
                  obscureText: true,
                  controller: passwordValue,
                  decoration: const InputDecoration(
                    label: Text('Password')
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10), 
                child: TextFormField(
                  controller: usernameValue,
                  decoration: const InputDecoration(
                    label: Text('Username')
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    addUser(emailValue.text, passwordValue.text, usernameValue.text);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Registration Success'),
                        content: const Text('We will redirect you to the login page'),
                        actions: [
                          TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }, 
                          child: const Text('Ok'))
                        ]
                      ),
                    );
                  } , 
                  child: const Text('Register')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
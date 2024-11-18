import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/Pages/home.dart';
import 'package:to_do_list_flutter/Pages/loading.dart';
import 'package:to_do_list_flutter/Pages/Auth/login.dart';
import 'package:to_do_list_flutter/Pages/Auth/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  return runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/': (context) => const Loading(),
      '/login': (context) => const Login(),
      '/home': (context) => const Home(),
      '/register': (context) => const Register(),
    }
  ));
}

// class CheckAuth extends StatefulWidget {
//   const CheckAuth({super.key});

//   @override
//   State<CheckAuth> createState() => _CheckAuthState();
// }

// class _CheckAuthState extends State<CheckAuth> {
//   bool isAuth = false;

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: CircularProgressIndicator(),
//         )
//       )
//     );
//   }

// }

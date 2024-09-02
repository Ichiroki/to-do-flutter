import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('To Do List', style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                
              }
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {

              }
            )
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          children: [
            Text("test")
          ],
        ),
      )
    );
  }
}
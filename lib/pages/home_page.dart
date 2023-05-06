import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  final int days = 30;
  final String name = "Coding";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
        body: Center(
          child: Container(
            child: Text("$days days of flutter by $name"),
          ),
        ),
        drawer: MyDrawer(),
      );
  }
}
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';


class DeveloperaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer'),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.only(top: 150),
        height: 1000,
        child: Text(
          'Made by Aditya Patkar!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/adi.png',
            ),
          ),
        ),
      ),
    );
  }
}

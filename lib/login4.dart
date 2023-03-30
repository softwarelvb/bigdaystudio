import 'package:bigdaystudio/main.dart';
import 'package:flutter/material.dart';

class LoginPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Favorites"),
        backgroundColor: colortheme.primaryColor,
      ),
      body: SafeArea(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // decoration: BoxDecoration(
                //   color: Colors.amberAccent.withOpacity(0.2),
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 40,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Restaurants',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hotel,
                      size: 40,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hotels',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Attractions',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

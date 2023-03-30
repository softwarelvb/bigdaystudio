import 'package:bigdaystudio/login4.dart';
import 'package:bigdaystudio/longin3.dart';
import 'package:bigdaystudio/screens/UserProfile/UserProfile.dart';
import 'package:bigdaystudio/screens/auth/Login.dart';
import 'package:bigdaystudio/screens/homepage/Menu1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../FindList/FindingPage.dart';
import 'MainPage.dart';
import 'Menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    MainPage(),
    SearchUserPage(),
    LoginPage123(),
    UserProfilePage(),
  ];

  void onSelectMenu(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    BottomAppBar bottomAppBar = BottomAppBar(
      color: colortheme.primaryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.home, size: 30),
                  color: _selectedIndex == 0 ? Colors.white : Colors.black54,
                  onPressed: () {
                    onSelectMenu(0);
                  },
                ),
                Text(
                  'ໜ້າຫຼັກ',
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.white : Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 4, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: _selectedIndex == 1 ? Colors.white : Colors.black54,
                  ),
                  onPressed: () {
                    onSelectMenu(1);
                  },
                ),
                Text(
                  'ຄົ້ນໜ້າ',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.white : Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 4, left: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.manage_history_sharp,
                    color: _selectedIndex == 2 ? Colors.white : Colors.black54,
                  ),
                  onPressed: () {
                    onSelectMenu(2);
                  },
                ),
                Text(
                  'ການຈັດການ',
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Colors.white : Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    onSelectMenu(3);
                  },
                  color: _selectedIndex == 3 ? Colors.white : Colors.black54,
                ),
                Text(
                  'ໂປຣຟາຍ',
                  style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.white : Colors.black54,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          },
          child: const Icon(Icons.add),
          backgroundColor: colortheme.primaryColor,
          foregroundColor: Colors.limeAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar);
  }
}

import 'package:bigdaystudio/screens/UserProfile/UserProfile.dart';
import 'package:bigdaystudio/screens/auth/Login.dart';
import 'package:bigdaystudio/screens/homepage/homepage1.dart';
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
    HomePage1(),
    const SearchUserPage(),
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
      clipBehavior: Clip.none,
      color: colortheme.primaryColor,
      shape: const CircularNotchedRectangle(),
      surfaceTintColor: Colors.transparent,
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, size: 30),
                  color: _selectedIndex == 0 ? Colors.white : Colors.black54,
                  onPressed: () {
                    onSelectMenu(0);
                  },
                ),
                Text(
                  'ໜ້າຫຼັກ',
                  style: TextStyle(
                      color:
                          _selectedIndex == 0 ? Colors.white : Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4, right: 30),
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
                      color:
                          _selectedIndex == 1 ? Colors.white : Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  'ການຈອງ',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4, left: 30),
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
                      color:
                          _selectedIndex == 2 ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    onSelectMenu(3);
                  },
                  color: _selectedIndex == 3 ? Colors.white : Colors.black54,
                ),
                Text(
                  'ໂປຣຟາຍ',
                  style: TextStyle(
                      color:
                          _selectedIndex == 3 ? Colors.white : Colors.black54,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600),
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
            Navigator.pushReplacementNamed(
                context, '/register');
          },
          backgroundColor: colortheme.primaryColor,
          foregroundColor: Colors.limeAccent,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar);
  }
}

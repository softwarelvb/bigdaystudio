import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Menu'),
        ),
        body: Column(
          children: [
            // GridView.count(
            //   crossAxisCount: 3, // Number of columns in the grid
            //   children: <Widget>[
            //     _buildMenuItem(context, 'Accounts', Icons.account_balance),
            //     _buildMenuItem(context, 'Transactions', Icons.swap_horiz),
            //     _buildMenuItem(context, 'Payments', Icons.payment),
            //     _buildMenuItem(context, 'Investments', Icons.trending_up),
            //     _buildMenuItem(context, 'Settings', Icons.settings),
            //     _buildMenuItem(context, 'Help', Icons.help),
            //   ],
            // ),
            Center(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("ok")),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("ok mama sungogme")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("ok 123")),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Navigate to the corresponding page
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(height: 16.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}

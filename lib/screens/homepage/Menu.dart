import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildRowItems(context),
            buildMenu(context),
            buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, IconData icon,
      {bool isSubmenu = false}) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation logic
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSubmenu
                  ? Theme.of(context).dividerColor
                  : Colors.transparent,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.headline6?.color,
              ),
            ),
            Spacer(),
            isSubmenu
                ? SizedBox()
                : Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).textTheme.caption?.color,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubmenuItem(
      BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation logic
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.subtitle1?.color,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).textTheme.caption?.color,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation logic
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.subtitle1?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRowItems(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRowItem(context, Icons.qr_code, 'Scan'),
          buildRowItem(context, Icons.person, 'Profile'),
          buildRowItem(context, Icons.notifications, 'Notifications'),
        ],
      ),
    );
  }

  Widget buildBottomButton(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // TODO: Add navigation logic
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomButton(context, Icons.camera_alt, 'Pay'),
          buildBottomButton(context, Icons.favorite_border, 'Favorites'),
        ],
      ),
    );
  }

  Widget buildMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildMenuItem(context, 'Accounts', Icons.account_balance),
        buildMenuItem(context, 'List Transactions', Icons.list_alt),
        buildMenuItem(context, 'Transfer Money', Icons.monetization_on),
        buildMenuItem(
            context, 'Bill Payment', Icons.payment, isSubmenu: true),
        buildSubmenuItem(context, 'Electric Payment', Icons.electrical_services),
        buildSubmenuItem(context, 'Water Payment', Icons.water_damage),
        buildSubmenuItem(context, 'Tax Payment', Icons.sticky_note_2),
        buildMenuItem(context, 'Settings', Icons.settings),
      ],
    );
  }
}
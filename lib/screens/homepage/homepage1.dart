import 'package:flutter/material.dart';

import 'dashboard.dart';

class HomePage1 extends StatelessWidget {
  final List<String> _transactions = [
    'Groceries',
    'Electricity Bill',
    'Credit Card Payment',
    'Car Loan Payment',
    'Salary Deposit',
    'Netflix Subscription',
    'Dining Out'
  ];

  final List<Map<String, dynamic>> _menuItems = [
    {
      'icon': Icons.account_balance_wallet,
      'label': 'Balance',
      'route': '/balance',
    },
    {
      'icon': Icons.payment,
      'label': 'Payments',
      'route': '/payments',
    },
    {
      'icon': Icons.credit_card,
      'label': 'Cards',
      'route': '/cards',
    },
    {
      'icon': Icons.monetization_on,
      'label': 'Investments',
      'route': '/investments',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: Text(
          'ໜ້າຫຼັກ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "ລາຍການທັງໝົດ",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: _menuItems.map((item) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(item['route']);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon']),
                      SizedBox(height: 5),
                      Text(item['label']),
                    ],
                  ),
                );
              }).toList(),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(40),
            //       bottomRight: Radius.circular(40),
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black26,
            //         blurRadius: 10,
            //         offset: Offset(0, 5),
            //       )
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'Balance',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(height: 10),
            //       Text(
            //         '\$3,500.00',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(height: 10),
            //       Text(
            //         'Available Balance: \$2,500.00',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10), left: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.app_registration),
                            Text(
                              'ລາຍການຈອງລ່າສຸດ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text(_transactions[index]),
                          subtitle: Text('-\$50.00'),
                          trailing: Text(
                            'Mar 15',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}

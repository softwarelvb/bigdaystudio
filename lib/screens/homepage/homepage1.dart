import 'package:flutter/material.dart';

import '../components/Dashboard.dart';
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

  HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        title: const Text(
          'ໜ້າຫຼັກ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
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
            const Row(
              children: [
                Icon(Icons.dashboard, size: 20, color: Colors.black54),
                Text(
                  " ລາຍການປະຈຳເດືອນ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.7,
              padding: const EdgeInsets.all(3),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/profile");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: DashboardCard(
                      title: 'ລາຍການທັງໝົດ',
                      textColors: Colors.white,
                      subtitle: '35',
                      icon: Icons.list,
                      iconColors: Colors.white,
                      startColor: Colors.amber[400]!,
                      endColor: Colors.amber,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: DashboardCard(
                    title: 'ລາຍການຖ່າຍແລ້ວ',
                    textColors: Colors.white,
                    subtitle: '22',
                    icon: Icons.done_all_sharp,
                    iconColors: Colors.white,
                    startColor: Colors.green,
                    endColor: Colors.greenAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: DashboardCard(
                    title: 'ລາຍການລໍຖ້າຖ່າຍ',
                    textColors: Colors.blueAccent,
                    subtitle: '13',
                    icon: Icons.manage_history_outlined,
                    iconColors: Colors.blueAccent,
                    startColor: Colors.white,
                    endColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: DashboardCard(
                    title: 'ລາຍການຍົກເລີກ',
                    textColors: Colors.deepOrangeAccent,
                    subtitle: '0',
                    icon: Icons.cancel,
                    iconColors: Colors.deepOrangeAccent,
                    startColor: Colors.white,
                    endColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
                elevation: 5,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(10), left: Radius.circular(10))),
                child: Column(
                  children: [
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.app_registration,
                              size: 18,
                            ),
                            Text(
                              ' ລາຍການລ່າສຸດ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: Text(_transactions[index]),
                          subtitle: const Text('-\$50.00'),
                          trailing: const Text(
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

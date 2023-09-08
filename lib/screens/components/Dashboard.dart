import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color startColor;
  final Color endColor;
  final Color iconColors;
  final Color textColors;

  DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.startColor,
    required this.endColor,
    required this.iconColors,
    required this.textColors,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(17.0),
      child: Container(
        height: 100,
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [startColor, endColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColors,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        subtitle,
                        style: TextStyle(
                            color: textColors,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '  ລາຍການ',
                        style: TextStyle(
                          color: textColors,
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                icon,
                color: iconColors,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

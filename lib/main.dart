import 'package:bigdaystudio/longin3.dart';
import 'package:bigdaystudio/screens/RegisterWed/RegisterWed.dart';
import 'package:bigdaystudio/screens/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


final colortheme = ThemeData(
    fontFamily: "NotoSansLao",
    primaryColor: Colors.amberAccent,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow));

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: colortheme,
      home: LoginPage3(),
      initialRoute: "/login",
      routes: {
        "/homepage": (context) => const HomePage(),
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage3()
      },
      locale: const Locale('es'), // Spanish locale
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Spanish
        // add more locales here
      ],
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyAppLayout());
// }
//
// class MyAppLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Color color = Theme.of(context).primaryColor;
//
//     Widget titleSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 Container(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: Text(
//                     'Oeschinen Lake Camground',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Text(
//                   'Kandersteg, Swizerland',
//                   style: TextStyle(color: Colors.grey[500]),
//                 )
//               ])),
//           Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           Text('41'),
//         ],
//       ),
//     );
//
//     Widget buttonSection = Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButtonColumn(color, Icons.call, 'Call'),
//           _buildButtonColumn(color, Icons.near_me, 'Route'),
//           _buildButtonColumn(color, Icons.share, 'Share'),
//         ],
//       ),
//     );
//
//     Widget textSection = Container(
//       padding: const EdgeInsets.all(32),
//       child: Text(
//         'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//         'Alps. Situated 1,578 meters above sea level, it is one of the '
//         'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//         'half-hour walk through pastures and pine forest, leads you to the '
//         'lake, which warms to 20 degrees Celsius in the summer. Activities '
//         'enjoyed here include rowing, and riding the summer toboggan run.',
//         softWrap: true,
//       ),
//     );
//
//     return MaterialApp(
//       title: 'Flutter Layout Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Layout Demo'),
//         ),
//         body: ListView(
//           children: [
//             Image.asset(
//               'images/lake.jpg',
//               width: 600,
//               height: 240,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       ),
//     );
//   }
//
//   Column _buildButtonColumn(Color color, IconData icon, String label) {
//     return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: color),
//           Container(
//             margin: const EdgeInsets.only(top: 8),
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 color: color,
//               ),
//             ),
//           ),
//         ]);
//   }
// }

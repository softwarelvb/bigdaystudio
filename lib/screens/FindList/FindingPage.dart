import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key});

  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUserPage> {
  String name = '';
  String tel = '';
  String address = '';
  DateTime? fromDate;
  DateTime? toDate;

  void search() {
    // Implement search logic here
  }

  void showModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modal Title'),
          content: const Text('This is a modal'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Search User',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => name = value),
              decoration: InputDecoration(
                hintText: 'Search by name',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon:
                    const Icon(Icons.person_outline, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => tel = value),
              decoration: InputDecoration(
                hintText: 'Search by telephone',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.call, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => address = value),
              decoration: InputDecoration(
                hintText: 'Search by address',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: fromDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          locale: const Locale("lo"));
                      if (selectedDate != null) {
                        setState(() => fromDate = selectedDate);
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          fromDate?.toString() ?? 'From date',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   side: BorderSide(color: Colors.grey),
                    // ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: toDate ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        locale: const Locale("lo"),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.amberAccent, // <-- SEE HERE
                                onPrimary: Colors.black, // <-- SEE HERE
                                onSurface: Colors.black,
                                surface: Colors.black, // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.amberAccent // button text color
                                    ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          toDate?.toString() ?? 'To date',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    // child: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   side: BorderSide(color: Colors.grey),
                    // ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                search();
                showModal();
              },
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
              // color: Colors.blue,
              // padding: EdgeInsets.symmetric(vertical: 16),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
            ),
            const  SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual search result count
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User $index',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Address $index',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tel $index',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Email $index',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SearchUserPage extends StatefulWidget {
//   @override
//   _SearchUserState createState() => _SearchUserState();
// }
//
// class _SearchUserState extends State<SearchUserPage> {
//   String name = '';
//   String tel = '';
//   String address = '';
//   DateTime? fromDate;
//   DateTime? toDate;
//
//   void search() {
//     // Implement search logic here
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         brightness: Brightness.light,
//         title: Text(
//           'Search User',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 16),
//             TextField(
//               onChanged: (value) => setState(() => name = value),
//               decoration: InputDecoration(
//                 hintText: 'Search by name',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               onChanged: (value) => setState(() => tel = value),
//               decoration: InputDecoration(
//                 hintText: 'Search by telephone',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 prefixIcon: Icon(Icons.call, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               onChanged: (value) => setState(() => address = value),
//               decoration: InputDecoration(
//                 hintText: 'Search by address',
//                 hintStyle: TextStyle(color: Colors.grey),
//                 prefixIcon: Icon(Icons.location_on, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       final selectedDate = await showDatePicker(
//                         context: context,
//                         initialDate: fromDate ?? DateTime.now(),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime.now(),
//                       );
//                       if (selectedDate != null) {
//                         setState(() => fromDate = selectedDate);
//                       }
//                     },
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.calendar_today,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           fromDate?.toString() ?? 'From date',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     // shape: RoundedRectangleBorder(
//                     //   borderRadius: BorderRadius.circular(10),
//                     //   side: BorderSide(color: Colors.grey),
//                     // ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       final selectedDate = await showDatePicker(
//                         context: context,
//                         initialDate: toDate ?? DateTime.now(),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime.now(),
//                       );
//                       if (selectedDate != null) {
//                         setState(() => toDate = selectedDate);
//                       }
//                     },
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.calendar_today,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           toDate?.toString() ?? 'To date',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     // child: RoundedRectangleBorder(
//                     //   borderRadius: BorderRadius.circular(10),
//                     //   side: BorderSide(color: Colors.grey),
//                     // ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: search,
//               child: Text(
//                 'Search',
//                 style: TextStyle(color: Colors.white),
//               ),
//               // color: Colors.blue,
//               // padding: EdgeInsets.symmetric(vertical: 16),
//               // shape: RoundedRectangleBorder(
//               //   borderRadius: BorderRadius.circular(10),
//               // ),
//             ),
//             SizedBox(height: 24),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10, // Replace with actual search result count
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 16),
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           spreadRadius: 1,
//                           blurRadius: 10,
//                           offset: Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'User $index',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Address $index',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Tel $index',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Email $index',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Photographer> photographers = [
    Photographer(
        name: 'John Doe',
        location: 'New York',
        speciality: 'Wedding Photography'),
    Photographer(
        name: 'Jane Smith',
        location: 'Los Angeles',
        speciality: 'Fashion Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
    Photographer(
        name: 'Samantha Lee',
        location: 'San Francisco',
        speciality: 'Portrait Photography'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "ໜ້າຫຼັກ",
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.amberAccent),
      body: Container(
        child: ListView.builder(
          itemCount: photographers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/${photographers[index].name}.jpg'),
              ),
              title: Text(photographers[index].name),
              subtitle: Text(
                  '${photographers[index].location} · ${photographers[index].speciality}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to photographer's profile page
              },
            );
          },
        ),
      ),
    );
  }
}

class Photographer {
  final String name;
  final String location;
  final String speciality;

  Photographer(
      {required this.name, required this.location, required this.speciality});
}

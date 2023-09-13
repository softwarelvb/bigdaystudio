import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateUserProfilePage extends StatefulWidget {
  const UpdateUserProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateUserProfilePage> createState() => _UpdateUserProfilePageState();
}

class _UpdateUserProfilePageState extends State<UpdateUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ອັບເດດຂໍ້ມູນຜູ້ໃຊ້",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: const Center(
        child: Text("center"),
      ),
    );
  }
}

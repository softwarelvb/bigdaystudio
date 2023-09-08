import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registeruser extends StatefulWidget {
  const Registeruser({Key? key}) : super(key: key);

  @override
  State<Registeruser> createState() => _RegisteruserState();
}

class _RegisteruserState extends State<Registeruser> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.amberAccent[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Image.asset('assets/xl.png', height: 140),
              ),
              const Text(
                "ລົງທະບຽນບັນຊີຜູ້ໃຊ້",
                style: TextStyle(fontSize: 25),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [],
                  ))
            ],
          )),
        ),
      ),
    );
  }
}

Widget _buildEmail(emailController, bool emailStateValid) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: "ອີເມວ",
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.email, color: Colors.black54),
      ),
      onChanged: (value) {
        emailStateValid = emailController.validate(value);
      },
    ),
  );
}

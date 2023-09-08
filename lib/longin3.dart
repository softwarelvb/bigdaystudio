import 'package:flutter/material.dart';

class LoginPage3 extends StatefulWidget {
  @override
  _LoginPage3State createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  final TextEditingController _emailController = TextEditingController();
  bool _emailStateValid = true;

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
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: Image.asset('assets/xl.png', height: 140),
                      ),
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'ຍິນດິຕ້ອນຮັບເຂົ້າສູ່',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'XL Wedding Studio',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'ກະລຸນາປ້ອນອີເມວ ແລະ ລະຫັດຜ່ານຂອງທ່ານ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Container(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 20),
                              _buildEmail(_emailController, _emailStateValid),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "ລະຫັດຜ່ານ",
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      prefixIcon: const Icon(Icons.lock,
                                          color: Colors.black54),
                                      suffixIcon: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black54,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text(
                            "ຈື່ລະຫັດຜ່ານ",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          activeColor: Colors.white,
                          checkColor: Colors.amberAccent,
                          value: true,
                          tileColor: Colors.white,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/homepage');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            child: const Text("ເຂົ້າສູ່ລະບົບ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'ລືມລະຫັດຜ່ານ?',
                            style: TextStyle(
                                color: Colors.grey[600]!,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.amberAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'ຍັງບໍ່ມີບັນຊີ ?',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/register-user');
                                },
                                child: const Text(
                                  'ລົງທະບຽນບັນຊີ',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
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

import 'package:flutter/material.dart';

import '../components/form/form.dart';

class LoginPage123 extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

  LoginPage123({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/xl.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  PasswordFormField(
                    hintText: 'Password',
                    controller: _passwordController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email or Phone',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Or Log In With',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/facebook_icon.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/google_icon.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

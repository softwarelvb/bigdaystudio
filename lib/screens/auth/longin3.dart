import 'package:bigdaystudio/bloc/Login/AuthBloc.dart';
import 'package:bigdaystudio/bloc/Login/AuthState.dart';
import 'package:bigdaystudio/loading/Loading.dart';
import 'package:bigdaystudio/models/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/Login/AuthEvent.dart';
import '../../models/UserModel.dart';
import '../../services/UserService.dart';
import '../../storage/UserStorage.dart';

class LoginFirebase extends StatefulWidget {
  const LoginFirebase({super.key});

  @override
  _LoginFirebaseState createState() => _LoginFirebaseState();
}

class _LoginFirebaseState extends State<LoginFirebase> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePass = true;
  bool _rememberMe = false;

  Profile profile = Profile();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = prefs.getString('username') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthAuthenticated) {
            UserModel user = state.user;
            await UserStorage.saveUser(
                user); // Store the user data using UserStorage
            Navigator.pushNamedAndRemoveUntil(
                context, '/homepage', (route) => false);
          } else if (state is AuthError) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                ),
                                child:
                                    Image.asset('assets/xl.png', height: 140),
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
                          ),
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
                                Column(
                                  children: <Widget>[
                                    Form(
                                        key: _formkey,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 20),
                                            _buildEmail(),
                                            const SizedBox(height: 10),
                                            _buildPassword()
                                          ],
                                        ))
                                  ],
                                ),
                                _buildCheckBox(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        // setState(() {
                                        //   _isLoading = true;
                                        // });
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        if (_rememberMe) {
                                          prefs.setString('username',
                                              _emailController.text);
                                          prefs.setString('password',
                                              _passwordController.text);
                                        } else {
                                          prefs.remove('username');
                                          prefs.remove('password');
                                        }

                                        context.read<AuthBloc>().add(LoginEvent(
                                            _emailController.text,
                                            _passwordController.text));
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                _buildForgotPassword(),
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
                                _buildNotHaveAccount(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              if (state is AuthLoading) const Loading(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'ກະລຸນາປ້ອນອີເມວໃຫ້ຖືກຕ້ອງ';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'ກະລຸນາປ້ອນອີເມວໃຫ້ຖືກຕ້ອງ';
          }
          return null;
        },
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
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: _hidePass,
        controller: _passwordController,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: "ລະຫັດຜ່ານ",
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.lock, color: Colors.black54),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hidePass = !_hidePass;
                });
              },
              icon: Icon(
                _hidePass ? Icons.remove_red_eye : Icons.visibility_off,
                color: Colors.black54,
              ),
            )),
      ),
    );
  }

  Widget _buildCheckBox() {
    return CheckboxListTile(
      title: const Text(
        "ບັນທຶກອີເມວ",
        style: TextStyle(
          fontSize: 13,
        ),
      ),
      activeColor: Colors.white,
      checkColor: Colors.amberAccent,
      value: _rememberMe,
      tileColor: Colors.white,
      onChanged: (value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          _rememberMe = value!;
        });
        print("_rememberMe ${_rememberMe}");
        await prefs.setBool('rememberMe', _rememberMe);
      },
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.white),
      ),
    );
  }

  Widget _buildNotHaveAccount() {
    return Center(
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
              Navigator.pushNamed(context, "/register-user");
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
    );
  }

  Widget _buildForgotPassword() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/reset-password");
      },
      child: Text(
        'ລືມລະຫັດຜ່ານ?',
        style: TextStyle(color: Colors.grey[600]!, fontWeight: FontWeight.w600),
      ),
    );
  }
}

import 'package:bigdaystudio/loading/Loading.dart';
import 'package:bigdaystudio/models/profile.dart';
import 'package:bigdaystudio/services/UserService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Profile profile = Profile();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  bool _isLoading = false;

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          return Scaffold(
              body: Stack(
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: Image.asset('assets/xl.png', height: 140),
                      ),
                      const Text(
                        "ລົງທະບຽນບັນຊີຜູ້ໃຊ້",
                        style: TextStyle(fontSize: 20),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              _buildName(),
                              const SizedBox(
                                height: 20,
                              ),
                              _buildPhone(),
                              const SizedBox(
                                height: 20,
                              ),
                              _buildEmail(),
                              const SizedBox(
                                height: 20,
                              ),
                              _buildPassword(),
                              const SizedBox(
                                height: 20,
                              ),
                              _buildConfirmPassword(),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: onRegister,
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
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          textStyle: MaterialStateProperty.all<
                                              TextStyle>(
                                            const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18,
                                                fontWeight: FontWeight
                                                    .w600 // Add font size here
                                                ),
                                          ),
                                        ),
                                        child: const Text(
                                          'ລົງທະບຽນ',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'ທ່ານມີບັນຊີແລ້ວບໍ?',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'ເຂົ້າສູ່ລະບົບ',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
                ),
              ),
              if (_isLoading) const Loading()
            ],
          ));
        });
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        controller: _nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'ກະລຸນາປ້ອນຊື່ ແລະ ນາມສະກຸນ';
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "ຊື່ ແລະ ນາມສະກຸນ",
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.person, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildPhone() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        controller: _phoneController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'ກະລຸນາປ້ອນເບີໂທລະສັບ';
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: "ເບີໂທລະສັບ",
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.phone_android, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        controller: _emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'ກະລຸນາປ້ອນອີເມວ';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'ກະລຸນາປ້ອນອີເມວໃຫ້ຖືກຕ້ອງ';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        controller: _passwordController,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'ກະລຸນາປ້ອນ ລະຫັດຜ່ານ ແລະ ຫຼາຍກ່ວາ 6 ຕົວອັກສອນ';
          }
          return null;
        },
        obscureText: _obscureTextPassword,
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
                  _obscureTextPassword = !_obscureTextPassword;
                });
              },
              icon: Icon(
                _obscureTextPassword
                    ? Icons.remove_red_eye
                    : Icons.visibility_off,
                color: Colors.black54,
              )),
        ),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: TextFormField(
          controller: _confirmPasswordController,
          validator: (value) {
            if (value!.isEmpty || value.length < 6) {
              return 'ກະລຸນາປ້ອນ ລະຫັດຜ່ານ ແລະ ຫຼາຍກ່ວາ 6 ຕົວອັກສອນ';
            }
            if ((_passwordController.text != _confirmPasswordController.text)) {
              return 'ລະຫັດຜ່ານບໍ່ກົງກັນ';
            }
            return null;
          },
          obscureText: _obscureTextConfirmPassword,
          decoration: InputDecoration(
            hintText: "ຢືນຢັນລະຫັດຜ່ານ",
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
                    _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                  });
                },
                icon: Icon(
                  _obscureTextConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black54,
                )),
          ),
        ));
  }

  void onRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      bool registrationResult = await AuthService.registerUser(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          role: 'U',
          phone: _phoneController.text.trim());
      if (registrationResult) {
        resetForm();
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  void resetForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
}

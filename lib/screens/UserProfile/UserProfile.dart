import 'package:bigdaystudio/loading/Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc/Login/AuthBloc.dart';
import '../../bloc/Login/AuthEvent.dart';
import '../../bloc/Login/AuthState.dart';
import '../../models/UserModel.dart';
import '../../services/UserService.dart';
import '../../storage/UserStorage.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String _name = 'John Doe';
  final String _email = 'johndoe@mail.com';
  final String _phone = '123-456-7890';
  final String _address = '123 Main St, Anytown, USA';
  final String _imagePath = 'assets/user_image.png';

  void _editProfile() {
    // TODO: Implement edit profile functionality
  }

  UserModel? _user;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    UserModel? userData = await UserStorage.getUser();
    setState(() {
      _user = userData;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Profile'),
  //     ),
  //     body: Center(
  //       child: _user != null
  //           ? Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text('Name: ${_user!.name}'),
  //           Text('Email: ${_user!.email}'),
  //           // Add more user information widgets as needed
  //         ],
  //       )
  //           : CircularProgressIndicator(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editProfile,
            ),
          ],
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
              // Handle logout success, navigate to login page or perform any other action
            }
          },
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              UserModel user = state.user;
              return ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.amberAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(_imagePath),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 16.0),
                          const Text(
                            'ຂໍ້ມູນຜູ້ໃຊ້',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Divider(color: Colors.grey),
                          const SizedBox(height: 8.0),
                          const Text(
                            'ຊື່ ແລະ ນາມສະກຸນ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'ອີເມວ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            user.email,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'ເບີໂທລະສັບ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            user.phone,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'ສິດທິໃນລະບົບ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            user.role == 'A' ? 'ຜູ້ດູແລລະບົບ' : 'ຜູ້ໃຊ້ທົ່ວໄປ',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<AuthBloc>().add(LogoutEvent());
                                },
                                child: const Text("Logout"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is AuthInitial) {
              return const Center(
                child: Text("ບໍ່ພົບຂໍ້ມູນ1"),
              );
            } else {
              return const Center(
                child: Text("ບໍ່ພົບຂໍ້ມູນ"),
              );
            }
          },
        ));
  }
}

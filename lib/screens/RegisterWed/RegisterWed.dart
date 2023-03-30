import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _photographer;
  String? _package;
  DateTime? _weddingDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter your name';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter your email';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return 'Please enter your phone number';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Photographer'),
                  value: _photographer,
                  items: ['Photographer 1', 'Photographer 2', 'Photographer 3']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _photographer = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Package'),
                  value: _package,
                  items: ['Package 1', 'Package 2', 'Package 3']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _package = value;
                    });
                  },
                ),
                // DateTimePickerFormField(
                //   decoration: InputDecoration(labelText: 'Wedding Date'),
                //   validator: (value) {
                //     if (value == null) {
                //       return 'Please select a date';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     setState(() {
                //       _weddingDate = value;
                //     });
                //   },
                // ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   _formKey.currentState.save();
                    //   // save data to database
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

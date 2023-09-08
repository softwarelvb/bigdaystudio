import 'package:flutter/material.dart';

class PhotographerReservationForm extends StatefulWidget {
  const PhotographerReservationForm({super.key});

  @override
  _PhotographerReservationFormState createState() =>
      _PhotographerReservationFormState();
}

class _PhotographerReservationFormState extends State<PhotographerReservationForm> {
  final _formKey = GlobalKey<FormState>();

  // Declare variables to store form data
  String? _eventName;
  String? _eventType;
  DateTime? _eventDate;
  TimeOfDay? _eventTime;
  String? _eventLocation;
  String? _phoneNumber;
  int? _numPhotographers;
  String? _photographyStyle;
  String? _photographyPackage;
  int? _numGuests;
  bool? _equipmentRental;
  bool? _secondShooter;
  bool? _needVideographer;
  String? _specialRequests;
  String? _paymentMethod;
  double? _paymentAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Photographer Reservation Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Event Details',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Event Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter event name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _eventName = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Event Type'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter event type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _eventType = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // DateTimeField(
                //   decoration: InputDecoration(labelText: 'Event Date and Time'),
                //   validator: (value) {
                //     if (value == null) {
                //       return 'Please select event date and time';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     setState(() {
                //       _eventDate = value!;
                //     });
                //   },
                //   format: DateFormat('yyyy-MM-dd h:mm a'),
                //   onShowPicker: (context, currentValue) async {
                //     final date = await showDatePicker(
                //         context: context,
                //         firstDate: DateTime.now(),
                //         initialDate: currentValue ?? DateTime.now(),
                //         lastDate: DateTime(2100));
                //     if (date != null) {
                //       final time = await showTimePicker(
                //         context: context,
                //         initialTime: TimeOfDay.fromDateTime(
                //             currentValue ?? DateTime.now()),
                //       );
                //       return DateTimeField.combine(date, time);
                //     } else {
                //       return currentvalue!;
                //     }
                //   },
                // ),
                const   SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Event Location'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter event location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _eventLocation = value!;
                    });
                  },
                ),
                const  SizedBox(height: 32.0),
                const  Text(
                  'Contact Information',
                  style: TextStyle(fontSize: 20.0),
                ),
                const   SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _phoneNumber = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your email address';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                    });
                  },
                ),
                const  SizedBox(height: 32.0),
                const  Text(
                  'Photographer Requirements',
                  style: TextStyle(fontSize: 20.0),
                ),
                const  SizedBox(height: 16.0),
                TextFormField(
                  decoration:
                  const InputDecoration(labelText: 'Number of Photographers'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter number of photographers required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _numPhotographers = int.parse(value!);
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Photography Style'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter photography style';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _photographyStyle = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Desired Photography Package'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter desired photography package';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _photographyPackage = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Expected Number of Guests'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter expected number of guests';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _numGuests = int.parse(value!);
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                CheckboxListTile(
                  title: const Text('Photography Equipment Rental'),
                  value: _equipmentRental ?? false,
                  onChanged: (value) {
                    setState(() {
                      _equipmentRental = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                CheckboxListTile(
                  title: const Text('Second Shooter'),
                  value: _secondShooter ?? false,
                  onChanged: (value) {
                    setState(() {
                      _secondShooter = value!;
                    });
                  },
                ),
                const  SizedBox(height: 16.0),
                CheckboxListTile(
                  title: const Text('Videographer'),
                  value: _needVideographer ?? false,
                  onChanged: (value) {
                    setState(() {
                      _needVideographer = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Special Requests/Instructions'),
                  maxLines: 4,
                  onSaved: (value) {
                    setState(() {
                      _specialRequests = value!;
                    });
                  },
                ),
                const  SizedBox(height: 32.0),
                const  Text(
                  'Payment Information',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration:  const InputDecoration(labelText: 'Payment Method'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter payment method';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                ),
                const  SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Payment Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter payment amount';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _paymentAmount = double.parse(value!);
                    });
                  },
                ),
                const  SizedBox(height: 32.0),
                const Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 20.0),
                ),
                const  SizedBox(height: 16.0),
                const  Text(
                  'By submitting this form, I agree to the terms and conditions set forth by the photography company. I understand that a deposit may be required to secure my reservation and that the remaining balance is due prior to the event. I also understand that cancellations made less than 30 days before the event may result in a cancellation fee.',
                  style: TextStyle(fontSize: 16.0),
                ),
                const  SizedBox(height: 32.0),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      // TODO: Implement form submission to backend
                    }
                  },
                  child: const Text('Submit'),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

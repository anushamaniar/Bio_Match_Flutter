// import 'package:flutter/material.dart';
// import 'package:biomatchflutter/login.dart';
//
// class Register2Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () =>
//                         Navigator.pop(context),
//                   ),
//                 ),
//                 Text(
//                   "Hello! Register yourself \nto get started",
//                   style: TextStyle(fontSize: 27.0),
//                   textAlign: TextAlign.center,
//                 ),
//
//                 const SizedBox(height: 90.0),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Aadhaar No.",
//                   ),
//                 ),
//
//                 const SizedBox(height: 20.0),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Address",
//                   ),
//                 ),
//
//                 const SizedBox(height: 20.0),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Date of Birth (DD/MM/YYYY)",
//                   ),
//                 ),
//
//                 const SizedBox(height: 20.0),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: "Gender",
//                   ),
//                 ),
//
//                 const Spacer(),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Register",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: Size(342, 56),
//                     backgroundColor: Color(0xFF1E232C),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero, // Set zero radius for squared corners
//                     ),
//
//                   ),
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                       child: Text("Login Now"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class Register2Page extends StatefulWidget {
  final String email;
  final String password;
  final String name;

  Register2Page({required this.email, required this.password, required this.name});

  @override
  _Register2PageState createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String? _selectedGender;
  String _errorMessage = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: widget.email,
          password: widget.password,
        );
        // Additional user information can be added to Firestore or Realtime Database here

        // Registration successful
        print('Registration successful: ${userCredential.user?.email}');
        // Navigate to login page or another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message ?? 'An unknown error occurred';
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'An unknown error occurred';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Text(
                    "Hello! Register yourself \nto get started",
                    style: TextStyle(fontSize: 27.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _aadhaarController,
                    decoration: InputDecoration(
                      labelText: "Aadhaar No.",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Aadhaar number';
                      }
                      if (value.length != 12 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Aadhaar number must be 12 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      hintText: "Date of Birth (DD/MM/YYYY)",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Color(0xFF1E232C),
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


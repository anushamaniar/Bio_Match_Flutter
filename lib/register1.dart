// import 'package:flutter/material.dart';
// import 'package:biomatchflutter/login.dart';
// import 'package:biomatchflutter/register2.dart';
//
// class Register1Page extends StatefulWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             // Allow scrolling if content overflows
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     onPressed: () =>
//                         Navigator.pop(context), // Handle back button press
//                   ),
//                 ),
//                 Text(
//                   'Hello! Register yourself\nto get started',
//                   style: TextStyle(
//                     fontSize: 27.0,
//                     color: Colors.black,
//                   ),
//                 ),
//
//                 SizedBox(height: 80.0),
//
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20.0),
//
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20.0),
//
//                 TextField(
//                   obscureText: true, // Hide password text
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20.0),
//
//                 TextField(
//                   obscureText: true, // Hide password text
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 40.0),
//
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Register2Page()),
//                     );
//                   },
//                   child: Text('Next',
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
//                 SizedBox(height: 20.0),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Already have an account?',
//                       style: TextStyle(fontSize: 17.0),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                       child: Text('Login Now'),
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
import 'package:bio_match_flutter/register2.dart';
import 'package:bio_match_flutter/login.dart';

class Register1Page extends StatefulWidget {
  @override
  _Register1PageState createState() => _Register1PageState();
}

class _Register1PageState extends State<Register1Page> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Text(
                    'Hello! Register yourself\nto get started',
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 80.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register2Page(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(342, 56),
                      backgroundColor: Color(0xFF1E232C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Login Now'),
                      ),
                    ],
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
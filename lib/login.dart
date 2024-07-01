// import 'package:flutter/material.dart';
// import 'package:biomatchflutter/register1.dart';
// import 'package:biomatchflutter/login_home.dart';
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(20.0), // Adjust padding as needed
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: IconButton(
//                   icon: Icon(Icons.arrow_back),
//                   onPressed: () =>
//                       Navigator.pop(context), // Handle back button press
//                 ),
//               ),
//               // Welcome Text
//               Text(
//                 'Welcome back!\nGlad to see you, again!',
//                 style: TextStyle(
//                   fontSize: 27.0,
//                   color: Colors.black,
//                 ),
//               ),
//
//               // Email ID Input
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email ID',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//
//               // Password Input
//               TextField(
//                 obscureText: true, // Hide password text
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//
//               // Login Button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => WelcomeBackPage()),
//                   );
//                 },
//                 child: Text(
//                     'Login',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(342, 56),
//                   backgroundColor: Color(0xFF1E232C),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero, // Set zero radius for squared corners
//                   ),
//
//                 ),
//               ),
//
//               // Register Text and Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Don\'t have an account?',
//                     style: TextStyle(fontSize: 17.0),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Register1Page()),
//                       );
//                     }, // Add functionality for registration
//                     child: Text('Register Now'),
//                   ),
//                 ],
//               ),
//
//               // Back Button (Optional)
//               // You can add a back button using IconButton or a similar widget
//               // and position it using appropriate layout options.
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register1.dart';
import 'package:bio_match_flutter/login_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to the welcome back page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeBackPage()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () =>
                      Navigator.pop(context), // Handle back button press
                ),
              ),
              // Welcome Text
              Text(
                'Welcome back!\nGlad to see you, again!',
                style: TextStyle(
                  fontSize: 27.0,
                  color: Colors.black,
                ),
              ),

              // Email ID Input
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

              // Password Input
              TextField(
                controller: _passwordController,
                obscureText: true, // Hide password text
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),

              // Display error message if any
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),

              // Login Button
              ElevatedButton(
                onPressed: _login,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(342, 56),
                  backgroundColor: Color(0xFF1E232C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                  ),
                ),
              ),

              // Register Text and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register1Page()),
                      );
                    }, // Add functionality for registration
                    child: Text('Register Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class WelcomeBackPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () =>
//                     Navigator.pop(context), // Handle back button press
//               ),
//             ),
//             Positioned(
//               top: 100,
//               left: 0,
//               right: 0,
//               child: Text(
//                 "Welcome Back!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 210,
//               left: 24,
//               right: 24,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(342, 56),
//                   backgroundColor: Color(0xFF1E232C),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero, // Set zero radius for squared corners
//                   ),
//
//                 ),
//                 child: Text(
//                   "Enroll",
//                   style: TextStyle(
//                     color: Colors.white,
//
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 340,
//               left: 24,
//               right: 24,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(342, 56),
//                   backgroundColor: Color(0xFF1E232C),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero, // Set zero radius for squared corners
//                   ),
//
//                 ),
//                 child: Text(
//                   "Update",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 380,
//               left: 24,
//               right: 24,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(342, 56),
//                   backgroundColor: Color(0xFF1E232C),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero, // Set zero radius for squared corners
//                   ),
//
//                 ),
//                 child: Text(
//                   "Authenticate",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class WelcomeBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context), // Handle back button press
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(342, 56),
                    backgroundColor: Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                    ),
                  ),
                  child: Text(
                    "Enroll",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50), // Adjust the spacing as needed
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(342, 56),
                    backgroundColor: Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                    ),
                  ),
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50), // Adjust the spacing as needed
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(342, 56),
                    backgroundColor: Color(0xFF1E232C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                    ),
                  ),
                  child: Text(
                    "Authenticate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

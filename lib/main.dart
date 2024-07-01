import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bio_match_flutter/login.dart';
import 'package:bio_match_flutter/register1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String? apiKey = dotenv.env['API_KEY'];
  if (kIsWeb && apiKey != null){
    await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: apiKey,
        appId: "1:964726193504:web:b4c6c5abd0b935fe4d3205",
        messagingSenderId: "964726193504",
        projectId: "biomatchflutter",),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF3960EA), Color(0xFFCED1EB)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/iitb.png',
                  width: 110,
                  height: 84,
                ),
                Image.asset(
                  'assets/aadhaar_logo.png',
                  width: 111,
                  height: 84,
                ),
              ],
            ),
            Spacer(flex: 1),
            Image.asset(
              'assets/fingerprint.png',
              width: 74,
              height: 79,
            ),
            Spacer(flex: 2),
            Text(
              'BioMatch',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Spacer(flex: 1),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(342, 56),
                  backgroundColor: Color(0xFF1E232C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                  ),

                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )

            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register1Page()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(342, 56),
                  backgroundColor: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Set zero radius for squared corners
                  ),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'login_home2.dart';
// import 'package:camera/camera.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   runApp(MyApp(cameras: cameras));
// }
//
// class MyApp extends StatelessWidget {
//   final List<CameraDescription> cameras;
//   const MyApp({super.key, required this.cameras});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(cameras: cameras),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final List<CameraDescription> cameras;
//   const HomePage({super.key, required this.cameras});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CameraApp(cameras: cameras),
//               ),
//             );
//           },
//           child: Text('Open Camera'),
//         ),
//       ),
//     );
//   }
// }
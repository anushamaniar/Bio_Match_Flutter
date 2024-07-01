import 'package:flutter/material.dart';

class LoginHomePage extends StatelessWidget {
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 342,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your left hand button functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Set the button background color
                      ),
                      child: Text(
                        'Left hand',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 342,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your right hand button functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Set the button background color
                      ),
                      child: Text(
                        'Right hand',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: 342,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your iris button functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Set the button background color
                      ),
                      child: Text(
                        'Iris',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'image_view_page.dart'; // Import the ImageViewPage if it's in a separate file
// import 'app_colors.dart'; // Import your AppColors if defined in a separate file
//
// class CameraApp extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   const CameraApp({super.key, required this.cameras});
//
//   @override
//   State<CameraApp> createState() => _CameraAppState();
// }
//
// class _CameraAppState extends State<CameraApp> {
//   late CameraController controller;
//   late XFile? imageFile; // Variable to store the captured image file
//   bool isCameraInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.cameras.isNotEmpty) {
//       controller = CameraController(widget.cameras[0], ResolutionPreset.max);
//       controller.initialize().then((_) {
//         if (!mounted) {
//           return;
//         }
//         setState(() {
//           isCameraInitialized = true;
//         });
//       }).catchError((Object e) {
//         if (e is CameraException) {
//           switch (e.code) {
//             case 'CameraAccessDenied':
//             // Handle access errors here.
//               break;
//             default:
//             // Handle other errors here.
//               break;
//           }
//         }
//       });
//     } else {
//       // Handle case where there are no cameras
//       setState(() {
//         isCameraInitialized = false;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!isCameraInitialized) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Take a picture'),
//           backgroundColor: AppColors.deepBlue,
//           leading: BackButton(
//             color: Colors.white,
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Center(
//           child: Text('No camera available or access denied'),
//         ),
//       );
//     }
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.deepBlue,
//           leading: BackButton(
//             color: Colors.white,
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           centerTitle: true,
//           title: Text(
//             'Take a picture',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Stack(
//           children: <Widget>[
//             CameraPreview(controller),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: FloatingActionButton(
//                   onPressed: () {
//                     _takePicture(); // Call method to take picture
//                   },
//                   child: Icon(Icons.camera),
//                   backgroundColor: Colors.white,
//                   foregroundColor: AppColors.deepBlue,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Method to take a picture
//   void _takePicture() async {
//     try {
//       final XFile picture = await controller.takePicture();
//       setState(() {
//         imageFile = picture;
//       });
//       // Navigate to the image view page after capturing the image
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ImageViewPage(imagePath: imageFile!.path),
//         ),
//       );
//     } catch (e) {
//       print("Error taking picture: $e");
//     }
//   }
// }

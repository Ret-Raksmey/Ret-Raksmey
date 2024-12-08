// import 'package:flutter/material.dart';

// List<String> images = [
//   "assets/w4-s1/bird.jpg",
//   "assets/w4-s1/bird2.jpg",
//   "assets/w4-s1/insect.jpg",
//   "assets/w4-s1/girl.jpg",
//   "assets/w4-s1/man.jpg",
// ];

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
//       home: Scaffold(
//         backgroundColor: Colors.green[50],
//         appBar: AppBar(
//           backgroundColor: Colors.green[400],
//           title: const Text('Image viewer'),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.navigate_before),
//               tooltip: 'Go to the previous image',
//               onPressed: () => {},
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
//               child: IconButton(
//                 icon: const Icon(Icons.navigate_next),
//                 tooltip: 'Go to the next image',
//                 onPressed: () => {},
//               ),
//             ),
//           ],
//         ),
//         body: Image.asset(images[0]),
//       ),
//     ));
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This removes the debug banner in the app.
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<String> images = [
    "assets/w4-s1/bird.jpg",
    "assets/w4-s1/bird2.jpg",
    "assets/w4-s1/insect.jpg",
    "assets/w4-s1/girl.jpg",
    "assets/w4-s1/man.jpg",
  ];
  int currentIndex = 0;

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next image',
            onPressed: nextImage,
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}

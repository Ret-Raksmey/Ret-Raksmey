import 'package:flutter/material.dart';

// Define the ProfileData and TileData models
class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> titles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.titles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String data;

  TileData({
    required this.icon,
    required this.title,
    required this.data,
  });
}

// Sample data
final profileData = ProfileData(
  name: 'Ronan OGOR',
  position: 'Flutter Developer',
  avatarUrl:
      'assets/w4-s1/flutter.png', // Replace with a valid image URL
  titles: [
    TileData(
      icon: Icons.phone,
      title: 'Phone Number',
      data: '+123 456 7890',
    ),
    TileData(
      icon: Icons.location_on,
      title: 'Address',
      data: 'Cambodia',
    ),
  ],
);

// The ProfileApp widget
class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CADT Student Profile'),
      ),
      body: Column(
        children: [
          // Profile header
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileData.avatarUrl),
                  radius: 40,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileData.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      profileData.position,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tiles list
          Expanded(
            child: ListView.builder(
              itemCount: profileData.titles.length,
              itemBuilder: (context, index) {
                final tile = profileData.titles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    subtitle: Text(tile.data),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Main function to run the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(profileData: profileData),
    );
  }
}
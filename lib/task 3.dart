import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi, Programmer",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search here...",
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Grid Menu
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FeatureIcon(title: "Category", icon: Icons.category, color: Colors.amber),
                FeatureIcon(title: "Classes", icon: Icons.video_library, color: Colors.green),
                FeatureIcon(title: "Free Course", icon: Icons.book, color: Colors.blue),
                FeatureIcon(title: "BookStore", icon: Icons.store, color: Colors.redAccent),
                FeatureIcon(title: "Live Course", icon: Icons.live_tv, color: Colors.purple),
                FeatureIcon(title: "Leaderboard", icon: Icons.emoji_events, color: Colors.lightGreen),
              ],
            ),
            const SizedBox(height: 20),

            // Courses Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See All", style: TextStyle(color: Colors.deepPurple)),
              ],
            ),
            const SizedBox(height: 10),

            // Courses Row
            Row(
              children: const [
                Expanded(
                  child: CourseCard(
                    title: "Flutter",
                    videos: "55 Videos",
                    imagePath: "assets/img_17.png",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CourseCard(
                    title: "React Native",
                    videos: "55 Videos",
                    imagePath: "assets/img_14.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Feature Icon Widget ---
class FeatureIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const FeatureIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}


class CourseCard extends StatelessWidget {
  final String title;
  final String videos;
  final String imagePath;

  const CourseCard({
    super.key,
    required this.title,
    required this.videos,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 40),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(videos, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

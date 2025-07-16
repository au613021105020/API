import 'package:flutter/material.dart';
class ExploreProPage extends StatelessWidget {
  const ExploreProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFD9A8FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(width: 10),
                  ),
                  Text(
                    'Happy Eaters by baby verse',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const Text(
                      "Explore Nourish Pro",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Expert-guided nutrition for your baby's needs, expert meal plans and daily support",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 30),

                    _buildPoint(
                      icon: Icons.check_circle,
                      title: "Nutrition Goals Selected",
                      description:
                      "Your journey is now personalized to your goals. We'll focus on what matters most to you.",
                      iconColor: Colors.purple,
                      showLine: true,
                    ),
                    const SizedBox(height: 20),

                    _buildPoint(
                      icon: Icons.food_bank,
                      title: "Custom Meal Planning",
                      description:
                      "Expert-crafted diet chart for your baby. Tailored to preferences and nutrition needs.",
                      iconColor: Colors.redAccent,
                      showLine: true,
                    ),
                    const SizedBox(height: 20),

                    _buildPoint(
                      icon: Icons.support_agent,
                      title: "Expert Guidance, Always",
                      description:
                      "Continuous expert support on WhatsApp. Get answers and advice whenever you need.",
                      iconColor: Colors.orangeAccent,
                      showLine: true,
                    ),
                    const SizedBox(height: 20),

                    _buildPoint(
                      icon: Icons.emoji_events,
                      title: "Want to Explore First?",
                      description:
                      "Start with our basic plan for free. Experience the Happy Eaters difference.",
                      iconColor: Colors.amber,
                      showLine: false, // no line for last item
                    ),
                  ],
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Join Nourish Pro - 20% OFF",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      side: const BorderSide(color: Colors.deepPurple),
                    ),
                    child: const Text(
                      "Try Basic Plan",
                      style: TextStyle(
                          fontSize: 16, color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom point widget with line
  Widget _buildPoint({
    required IconData icon,
    required String title,
    required String description,
    required Color iconColor,
    required bool showLine,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon with optional vertical line
        Column(
          children: [
            Icon(icon, color: iconColor, size: 20),
            if (showLine)
              Container(
                width: 2,
                height: 50,
                color: Colors.black,
              ),
          ],
        ),
        const SizedBox(width: 12),

        // Title and description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style:
                const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


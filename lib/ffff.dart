import 'package:flutter/material.dart';
import 'package:untitled1/taskc2.dart';



class BabyMealPlanPage extends StatelessWidget {
  const BabyMealPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(

        child: Column(
          children: [
            // Header
            Container(

              padding: const EdgeInsets.all(45),

              decoration: const BoxDecoration(
                color: Color(0xFFD9A8FF),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),

                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Icon(Icons.arrow_back_ios,color: Colors.white),
                      ),
                      Image.asset(
                        'assets/img_3-removebg-preview.png',
                        height:55,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Happy Eaters by baby verse",

                        style: TextStyle(

                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Aarya Sena's Meal plan is now ready",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text("Here's a sneakpeek of it", style: TextStyle(color: Colors.black54)),


            const SizedBox(height: 16),

            // Meal Cards
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Breakfast Title
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(image: AssetImage('assets/img_5.png',))
                            ),
                            ),
                          const SizedBox(width: 8),
                          const Text("Breakfast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Dosa Card
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/img_6.png', width: 70, height: 70, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Dosa", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text("Tiffin Friendly, Gut Friendly + 9 more", style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.timer, size: 14, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text("5 mins", style: TextStyle(fontSize: 12)),
                                      SizedBox(width: 10),
                                      Icon(Icons.rice_bowl, size: 14, color: Colors.orange),
                                      SizedBox(width: 4),
                                      Text("Grains", style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),


                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/img_12.png', width: 70, height: 70, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Baby Friendly Fenugreek Leaves Sambar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.timer, size: 14, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text("25 mins", style: TextStyle(fontSize: 12)),
                                      SizedBox(width: 10),
                                      Icon(Icons.soup_kitchen, size: 14, color: Colors.deepOrange),
                                      SizedBox(width: 4),
                                      Text("Pulses + Veg", style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset('assets/img_13.png', width: 70, height: 70, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Lunch is calling, and I must go.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.timer, size: 14, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text("20 mins", style: TextStyle(fontSize: 12)),
                                      SizedBox(width: 10),
                                      Icon(Icons.soup_kitchen, size: 14, color: Colors.deepOrange),
                                      SizedBox(width: 4),
                                      Text("Veg", style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ExploreProPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "Continue",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),

                      // Lunch section




                    ],
                  ),
                ),
              ),
            ),

            // Continue Button


          ],
        ),
      ),
    );
  }
}
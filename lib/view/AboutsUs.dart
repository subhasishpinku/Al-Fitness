import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "About Me",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Stack(
          children: [
            // 🔹 BACKGROUND IMAGE
            Positioned.fill(
              child: Image.asset(
                "assets/images/cg55.jpg", // your background image path
                fit: BoxFit.cover,
              ),
            ),

            // 🔹 MAIN CONTENT (SCROLLABLE)
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader("💪 About Me"),
                  const SizedBox(height: 10),
                  const Text(
                    "Hi, I'm Chandradip Ghosh, a Certified Personal Fitness Trainer and Certified Nutritionist with a deep passion for helping people build healthier, stronger, and more confident lives.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Over the years, I’ve worked with individuals of all fitness levels — from beginners to athletes — designing personalized workout and nutrition plans that truly work. My focus is on creating routines that are sustainable, balanced, and results-driven, helping you feel your best both physically and mentally.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "I believe fitness is not just about lifting weights or losing fat — it’s about building a lifestyle that empowers you to move better, eat smarter, and live happier.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),

                  const SizedBox(height: 25),

                  _sectionHeader("🥗 My Approach"),
                  const SizedBox(height: 10),
                  _bullet("Personalized workout plans based on your goals"),
                  _bullet(
                    "Balanced nutrition guidance to support your training",
                  ),
                  _bullet("Mindset and motivation to help you stay consistent"),
                  _bullet(
                    "Real results through simple, effective, and practical methods",
                  ),

                  const SizedBox(height: 25),

                  _sectionHeader("🎓 My Certifications"),
                  const SizedBox(height: 10),

                  const Text(
                    "• Certified Personal Fitness Trainer",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _certificateImage("assets/images/cerP.png"),
                  const SizedBox(height: 20),

                  const Text(
                    "• Certified Nutritionist",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _certificateImage("assets/images/cerN.png"),

                  const SizedBox(height: 30),

                  _sectionHeader("❤️ My Mission"),
                  const SizedBox(height: 10),
                  const Text(
                    "To inspire and guide you toward achieving your fitness goals while creating a healthy, confident, and sustainable lifestyle. My aim is to make fitness accessible and enjoyable for everyone.",
                    style: TextStyle(fontSize: 15, height: 1.4),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---------------------------------------------------------
  // SECTION HEADER WIDGET
  //---------------------------------------------------------
  Widget _sectionHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  //---------------------------------------------------------
  // BULLET LIST WIDGET
  //---------------------------------------------------------
  Widget _bullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("•  ", style: TextStyle(fontSize: 18)),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 15, height: 1.4)),
        ),
      ],
    );
  }

  //---------------------------------------------------------
  // CERTIFICATE IMAGE WIDGET
  //---------------------------------------------------------
  Widget _certificateImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}

import 'package:aifitness/utils/app_colors.dart';
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/viewModel/begin_your_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  String? deviceId = "";
  String? email = "";
  String? password = "";
  String? imageFullUrl = "";
  String? name = "";
  int userId = 0;
  @override
  void initState() {
    super.initState();
    // load();
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userId = prefs.getInt("user_id") ?? 0;
      deviceId = prefs.getString("device_id");
      name = prefs.getString("name");
      email = prefs.getString("email");
      imageFullUrl = prefs.getString("image_full_url");
      password = prefs.getString("password");
    });

    // ---- SESSION CHECK ----
    if (email != null &&
        password != null &&
        email!.isNotEmpty &&
        password!.isNotEmpty) {
      final vm = Provider.of<BeginYourViewModel>(context, listen: false);
      vm.loadingState(context, email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            // ------------------ BACKGROUND IMAGE ------------------
            Positioned.fill(
              child: Image.asset("assets/images/bg1.png", fit: BoxFit.cover),
            ),

            // ------------------ MAIN CONTENT ------------------
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(), // space at top
                    // Center text in middle of screen
                    // ------------------ ADD IMAGE HERE ------------------
                    Image.asset(
                      "assets/images/logo2.png", // <--- your image
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Diet and Exercise Planner",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),

                    const Spacer(), // space below text (now it's vertically centered)
                    // Get Started Button (near bottom)
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0),
                          side: const BorderSide(
                            color: AppColors
                                .bolderColor, // <-- added custom border color
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.beginYourScreen,
                          );
                        },
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            color: AppColors
                                .primaryColor, // <-- optional: match text color too
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

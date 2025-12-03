import 'package:aifitness/utils/app_colors.dart';
import 'package:aifitness/viewModel/contact_us_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  int userId = 0;
  String? deviceId = "";
  String? name = "";
  String? savedEmail = "";
  String? imageFullUrl = "";

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  /// Load Shared Preferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userId = prefs.getInt("user_id") ?? 0;
      deviceId = prefs.getString("device_id");
      name = prefs.getString("name");
      savedEmail = prefs.getString("email");
      imageFullUrl = prefs.getString("image_full_url");
    });

    // Pre-fill email if available
    if (savedEmail != null) {
      emailController.text = savedEmail!;
    }

    print(
      "UserDetails => $userId | $deviceId | $name | $savedEmail | $imageFullUrl",
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactVM = Provider.of<ContactUsViewModel>(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            /// Background Image with low opacity
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset("assets/images/cg55.jpg", fit: BoxFit.cover),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Top Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                        const Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close, size: 24),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// Email Field
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                        color: AppColors
                            .secondaryColor, //  change this to any color you want
                        fontSize: 16,
                      ),
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.secondaryColor,
                        ),
                        hintText: "Email",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xFF8A8AFF),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xFF8A8AFF),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Message Label
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Message",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Message Field
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      child: TextField(
                        controller: messageController,
                        maxLines: 7,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          hintText: "Write your message...",
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Submit Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 1.5,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          // Validation
                          if (emailController.text.isEmpty) {
                            showSnack(context, "Email is required");
                            return;
                          }
                          if (messageController.text.isEmpty) {
                            showSnack(context, "Message is required");
                            return;
                          }

                          // API Call
                          final res = await contactVM.sendContactDetails(
                            userId: userId,
                            email: emailController.text.trim(),
                            message: messageController.text.trim(),
                            deviceId: deviceId ?? "",
                          );

                          if (res["success"] == true) {
                            showSnack(context, res["message"]);
                            emailController.clear();
                            messageController.clear();
                          } else {
                            showSnack(context, res["message"]);
                          }
                        },
                        child: contactVM.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.blue,
                              )
                            : const Text(
                                "SUBMIT",
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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

  /// Snackbar helper
  void showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

import 'package:aifitness/repository/RegisterRepository.dart';
import 'package:aifitness/res/widgets/coloors.dart';
import 'package:aifitness/res/widgets/signin_second_appbar.dart';
import 'package:aifitness/viewModel/RegisterViewModel.dart';
import 'package:aifitness/viewModel/signin_twentyfour_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreenTwentyFour extends StatefulWidget {
  const SigninScreenTwentyFour({super.key});

  @override
  State<SigninScreenTwentyFour> createState() => _SigninScreenTwentyFourState();
}

class _SigninScreenTwentyFourState extends State<SigninScreenTwentyFour> {
  String _deviceId = 'Unknown';
  final _mobileDeviceIdentifierPlugin = MobileDeviceIdentifier();

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    String deviceId;
    try {
      deviceId =
          await _mobileDeviceIdentifierPlugin.getDeviceId() ??
          'Unknown platform version';
    } on PlatformException {
      deviceId = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() async {
      _deviceId = deviceId;
      _deviceId = deviceId;
      // print("_deviceId $_deviceId");
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("device_id", _deviceId);
      print(prefs.getString("device_id"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider(
        create: (_) => RegisterViewModel(RegisterRepository1()),
        child: Consumer<RegisterViewModel>(
          builder: (context, viewModel, _) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              appBar: const SigninSecondAppBar(),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 15,
                          ),
                          side: BorderSide(color: AppColors.backgroundColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: AppColors.primaryColor,
                          backgroundColor: AppColors.signInButtonColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "To create your profile and save your data, we'll need some basic personal information. "
                          "This way, you won’t have to enter it again each time you open the app.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    IntrinsicWidth(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 15,
                          ),
                          side: BorderSide(color: AppColors.backgroundColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: AppColors.primaryColor,
                          backgroundColor: AppColors.signInButtonColor,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Don’t worry — we won’t send you any unwanted emails or spam.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "Please enter your personal \n .information to proceed",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Full Name
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: viewModel.fullNameController,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Email
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: viewModel.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Password
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: viewModel.passwordController,
                        obscureText: !viewModel.isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: viewModel.togglePasswordVisibility,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => viewModel.onNextPressed(context),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Device ID: $_deviceId",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

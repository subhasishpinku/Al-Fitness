import 'package:aifitness/models/login_response_model.dart';

class LoginResponse {
  final bool success;
  final String message;
  final String token;
  final LoginData data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'] ?? "",
      token: json['token'] ?? "",
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final UserDetails userDetails;
  final DayDetails dayDetails;

  LoginData({
    required this.userDetails,
    required this.dayDetails,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userDetails: UserDetails.fromJson(json['user_details']),
      dayDetails: DayDetails.fromJson(json['day_details']),
    );
  }
}

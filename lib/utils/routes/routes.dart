import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/view/get_start_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.getStartScreen):
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetStartScreen());
     
      
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No route is configured"),
            ),
          ),
        );
    }
  }
}
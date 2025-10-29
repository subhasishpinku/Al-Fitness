import 'package:aifitness/utils/routes/routes.dart';
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/view/extra_food_intake_screen.dart';
import 'package:aifitness/view/get_start_screen.dart';
import 'package:aifitness/view/signin_screen_twenty_five.dart';
import 'package:aifitness/view/signin_screen_twenty_one.dart';
import 'package:aifitness/viewModel/dashboardBody_viewModel.dart';
import 'package:aifitness/viewModel/extra_food_intake_viewModel.dart';
import 'package:aifitness/viewModel/login_viewModel.dart';
import 'package:aifitness/viewModel/sigin_eighteen_viewModel.dart';
import 'package:aifitness/viewModel/sigin_fifteen_viewModel.dart';
import 'package:aifitness/viewModel/sigin_foutreen_viewModel.dart';
import 'package:aifitness/viewModel/sigin_seventeen_viewModel.dart';
import 'package:aifitness/viewModel/sigin_sixteen_viewModel.dart';
import 'package:aifitness/viewModel/signin_eight_viewModel.dart';
import 'package:aifitness/viewModel/signin_fifth_viewModel.dart';
import 'package:aifitness/viewModel/signin_fourth_viewModel.dart';
import 'package:aifitness/viewModel/signin_nineteen_viewModel.dart';
import 'package:aifitness/viewModel/signin_ninth_viewModel.dart';
import 'package:aifitness/viewModel/signin_second_viewModel.dart';
import 'package:aifitness/viewModel/signin_seventh_viewModel.dart';
import 'package:aifitness/viewModel/signin_sixth_viewModel.dart';
import 'package:aifitness/viewModel/signin_tenth_viewModel.dart';
import 'package:aifitness/viewModel/signin_third_viewModel.dart';
import 'package:aifitness/viewModel/signin_thirteen_viewModel.dart';
import 'package:aifitness/viewModel/signin_twelve_viewModel.dart';
import 'package:aifitness/viewModel/signin_twentyTwo_viewModel.dart';
import 'package:aifitness/viewModel/signin_twenty_viewModel.dart';
import 'package:aifitness/viewModel/signin_twentyfive_viewModel.dart';
import 'package:aifitness/viewModel/signin_twentyfour_viewModel.dart';
import 'package:aifitness/viewModel/signin_twentyone_viewModel.dart';
import 'package:aifitness/viewModel/signin_twentythree_viewModel.dart';
import 'package:aifitness/viewModel/signin_viewmodel.dart';
import 'package:aifitness/viewModel/weight_today_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninViewModel()),
        ChangeNotifierProvider(create: (_) => SigninSecondViewModel()),
        ChangeNotifierProvider(create: (_) => SigninThirdViewModel()),
        ChangeNotifierProvider(create: (_) => SigninFourthViewModel()),
        ChangeNotifierProvider(create: (_) => SigninFifthViewModel()),
        ChangeNotifierProvider(create: (_) => SigninSixthViewModel()),
        ChangeNotifierProvider(create: (_) => SigninSeventhViewModel()),
        ChangeNotifierProvider(create: (_) => SigninEightViewModel()),
        ChangeNotifierProvider(create: (_) => SigninNinthViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTenthViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SigninEightViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwelveViewModel()),
        ChangeNotifierProvider(create: (_) => SigninThirteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninFourteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninFifteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninSixteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninSeventeenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninEighteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninNineteenViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyOneViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyTwoViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyThreeViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyFourViewModel()),
        ChangeNotifierProvider(create: (_) => SigninTwentyFiveViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardBodyViewModel()),
        ChangeNotifierProvider(create: (_) => ExtraFoodIntakeViewModel()),
        ChangeNotifierProvider(create: (_) => WeightTodayViewModel()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouteNames.getStartScreen,
      onGenerateRoute: Routes.generateRoutes,
      //  This ensures everything is RTL
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}

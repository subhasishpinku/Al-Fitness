import 'package:aifitness/res/widgets/dashboard.dart';
import 'package:aifitness/utils/routes/routes_names.dart';
import 'package:aifitness/view/FitNetwork.dart';
import 'package:aifitness/view/Target_change_screen.dart';
import 'package:aifitness/view/Visceral_fat_screen.dart';
import 'package:aifitness/view/account_setting_screen.dart';
import 'package:aifitness/view/body_fat_screen.dart';
import 'package:aifitness/view/body_image_progress.dart';
import 'package:aifitness/view/body_water_screen.dart';
import 'package:aifitness/view/change_details.dart';
import 'package:aifitness/view/exercise_list_details.dart';
import 'package:aifitness/view/exercise_list_screen.dart';
import 'package:aifitness/view/extra_food_intake_screen.dart';
import 'package:aifitness/view/get_start_screen.dart';
import 'package:aifitness/view/i_am_ready.dart';
import 'package:aifitness/view/i_am_ready_final.dart';
import 'package:aifitness/view/login_screen.dart';
import 'package:aifitness/view/muscle_gain.dart';
import 'package:aifitness/view/nutrition_screen.dart';
import 'package:aifitness/view/signin_screen.dart';
import 'package:aifitness/view/signin_screen_eight.dart';
import 'package:aifitness/view/signin_screen_eighteen.dart';
import 'package:aifitness/view/signin_screen_eleventh.dart';
import 'package:aifitness/view/signin_screen_fifteen.dart';
import 'package:aifitness/view/signin_screen_fifth.dart';
import 'package:aifitness/view/signin_screen_fourteen.dart';
import 'package:aifitness/view/signin_screen_fourth.dart';
import 'package:aifitness/view/signin_screen_nineteen.dart';
import 'package:aifitness/view/signin_screen_ninth.dart';
import 'package:aifitness/view/signin_screen_second.dart';
import 'package:aifitness/view/signin_screen_seventeen.dart';
import 'package:aifitness/view/signin_screen_seventh.dart';
import 'package:aifitness/view/signin_screen_sixteen.dart';
import 'package:aifitness/view/signin_screen_sixth.dart';
import 'package:aifitness/view/signin_screen_tenth.dart';
import 'package:aifitness/view/signin_screen_third.dart';
import 'package:aifitness/view/signin_screen_thirteen.dart';
import 'package:aifitness/view/signin_screen_twelve.dart';
import 'package:aifitness/view/signin_screen_twenty.dart';
import 'package:aifitness/view/signin_screen_twenty_five.dart';
import 'package:aifitness/view/signin_screen_twenty_four.dart';
import 'package:aifitness/view/signin_screen_twenty_one.dart';
import 'package:aifitness/view/signin_screen_twenty_three.dart';
import 'package:aifitness/view/signin_screen_twenty_two.dart';
import 'package:aifitness/view/skeletal_muscle_screen.dart';
import 'package:aifitness/view/subcutaneous_fat_screen.dart';
import 'package:aifitness/view/target_change_details.dart';
import 'package:aifitness/view/video_screen.dart';
import 'package:aifitness/view/view_plan_screen.dart';
import 'package:aifitness/view/weight_today_screen.dart';
import 'package:aifitness/viewModel/weight_today_viewModel.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.getStartScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const GetStartScreen(),
        );
      case (RouteNames.signinScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreen(),
        );
      case (RouteNames.signinScreenSecond):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSecond(),
        );
      case (RouteNames.signinScreenThird):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenThird(),
        );
      case (RouteNames.signinScreenFourth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFourth(),
        );
      case (RouteNames.signinScreenFifth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFifth(),
        );
      case (RouteNames.signinScreenSixth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSixth(),
        );
      case (RouteNames.signinScreenSeventh):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSeventh(),
        );
      case (RouteNames.signinScreenEight):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenEight(),
        );
      case (RouteNames.signinScreenNinth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenNinth(),
        );
      case (RouteNames.signinScreenTenth):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTenth(),
        );
      case (RouteNames.loginScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case (RouteNames.signinScreenEleventh):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenEleventh(),
        );
      case (RouteNames.signinScreenTwelve):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwelve(),
        );
      case (RouteNames.signinScreenThirteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenThirteen(),
        );
      case (RouteNames.signinScreenFourteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFourteen(),
        );
      case (RouteNames.signinScreenFifteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenFifteen(),
        );
      case (RouteNames.signinScreenSixteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSixteen(),
        );
      case (RouteNames.signinScreenSeventeen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenSeventeen(),
        );
      case (RouteNames.signinScreenEighteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenEighteen(),
        );
      case (RouteNames.signinScreenNineteen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenNineteen(),
        );
      case (RouteNames.signinScreenTwenty):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwenty(),
        );
      case (RouteNames.signinScreenTwentyOne):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwentyOne(),
        );
      case (RouteNames.signinScreenTwentyTwo):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwentyTwo(),
        );
      case (RouteNames.signinScreenTwentyThree):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwentyThree(),
        );
      case (RouteNames.signinScreenTwentyFour):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwentyFour(),
        );
      case (RouteNames.signinScreenTwentyFive):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SigninScreenTwentyFive(),
        );
      case (RouteNames.dashboard):
        return MaterialPageRoute(
          builder: (BuildContext context) => const Dashboard(),
        );
      case (RouteNames.extraFoodIntakeScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const ExtraFoodIntakeScreen(),
        );
      case (RouteNames.weightTodayScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const WeightTodayScreen(),
        );
      case (RouteNames.targetChangeDetails):
        return MaterialPageRoute(
          builder: (BuildContext context) => const TargetChangeDetails(),
        );
      case (RouteNames.changeDetails):
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangeDetails(),
        );
      case (RouteNames.bodyImageProgress):
        return MaterialPageRoute(
          builder: (BuildContext context) => const BodyImageProgress(),
        );
      case (RouteNames.accountSettingScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const AccountSettingScreen(),
        );
      case (RouteNames.nutritionScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const NutritionScreen(),
        );
      case (RouteNames.viewPlanScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const ViewPlanScreen(),
        );
      case (RouteNames.exerciseListScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const ExerciseListScreen(),
        );
      case (RouteNames.exerciseListDetails):
        return MaterialPageRoute(
          builder: (BuildContext context) => const ExerciseListDetails(),
        );
      case (RouteNames.videoScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const VideoScreen(),
        );
      case (RouteNames.iamReady):
        return MaterialPageRoute(
          builder: (BuildContext context) => const IamReady(),
        );
      case (RouteNames.iamReadyFinal):
        return MaterialPageRoute(
          builder: (BuildContext context) => const IamReadyFinal(),
        );
      case (RouteNames.muscleGain):
        return MaterialPageRoute(
          builder: (BuildContext context) => const MuscleGainScreen(),
        );
      case (RouteNames.bodyFatScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const BodyFatScreen(),
        );
      case (RouteNames.skeletalMuscleScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SkeletalMuscleScreen(),
        );
      case (RouteNames.subcutaneousFatScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const SubcutaneousFatScreen(),
        );
      case (RouteNames.visceralFatScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const VisceralFatScreen(),
        );
      case (RouteNames.bodyWaterScreen):
        return MaterialPageRoute(
          builder: (BuildContext context) => const BodyWaterScreen(),
        );
      case (RouteNames.fitNetwork):
        return MaterialPageRoute(
          builder: (BuildContext context) => const FitNetwork(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No route is configured")),
          ),
        );
    }
  }
}

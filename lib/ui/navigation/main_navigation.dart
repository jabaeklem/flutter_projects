import 'package:car_m/ui/screens/bottom_nav_bar.dart';
import 'package:car_m/ui/screens/own_profile/own_profile.dart';
import 'package:car_m/ui/screens/own_profile/widgets/all_posts.dart';
import 'package:car_m/ui/screens/own_profile/widgets/create_post_widget/create_post_widget.dart';
import 'package:car_m/ui/screens/profile/profile.dart';
import 'package:car_m/ui/screens/registration_screen/confirmation_screen.dart';
import 'package:car_m/ui/screens/registration_screen/information_screen.dart';
import 'package:car_m/ui/screens/registration_screen/passwords_screen.dart';
import 'package:car_m/ui/screens/registration_screen/registration_page.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen/login_screen.dart';
import '../screens/news_page/widgets/check_story_widget/check_story_widget.dart';
import '../test_widget.dart';

class MainNavigationRouteNames {
  static const String profile = 'profile';
  static const String loginPage = '/';
  static const String mainRoute = 'navBar';
  static const String test = 'test';
  static const String registrationPage = '/register/';
  static const String confirmationPage = '/register/confirm/';
  static const String informationPage = '/register/confirm/info';
  static const String passswordPage = '/register/confirm/info/password';
  static const String stories = 'navBar/storues';
  static const String ownProfile = 'navBar/ownProfile';
  static const String createPostWidget = 'navBar/ownProfile';
  static const String ownPostWidget = 'posts';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.loginPage;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.profile: (context) => const ProfileWidget(),
    MainNavigationRouteNames.loginPage: (context) => const LoginScreen(),
    MainNavigationRouteNames.mainRoute: (context) => const BottomNavBar(),
    MainNavigationRouteNames.registrationPage: (context) => const RegistrationPage(),
    MainNavigationRouteNames.confirmationPage: (context) => const ConfirmationPage(),
    MainNavigationRouteNames.informationPage: (context) => const InformationPage(),
    MainNavigationRouteNames.passswordPage: (context) => const PasswordScreen(),
    MainNavigationRouteNames.test: (context) => TestWidget(),
    MainNavigationRouteNames.stories: (context) => CheckStoryWidget(),
    MainNavigationRouteNames.ownProfile: (context) => const OwnProfileWidget(),
    MainNavigationRouteNames.ownPostWidget: (context) => const OwnPostsWidget(),
  };
}
class MainNavigationPush {
  Route<RegistrationPage> registration = MaterialPageRoute(builder: (context) => const RegistrationPage());
  Route<ConfirmationPage> confirmation = MaterialPageRoute(builder: (context) => const ConfirmationPage());
  Route<InformationPage> information = MaterialPageRoute(builder: (context) => const InformationPage());
  Route<InformationPage> ownProfile = MaterialPageRoute(builder: (context) => const OwnProfileWidget());
  Route<PasswordScreen> security = MaterialPageRoute(builder: (context) => const PasswordScreen());
  Route<PasswordScreen> stories = MaterialPageRoute(builder: (context) => CheckStoryWidget());
  Route<PasswordScreen> createPostWidget = MaterialPageRoute(builder: (context) => const CreatePostWidgetProfile());
}

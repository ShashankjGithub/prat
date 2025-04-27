import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prat/modal/dataModal.dart';
import 'package:prat/pages/auth/signInPage.dart';
import 'package:prat/pages/home/homePage.dart';
import 'package:prat/pages/spalshPage/splashPage.dart';


// GoRouter configuration
final router = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/signIn',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/home',

      builder: (context, state){
        final Data data = state.extra as Data;
        return HomePage(data: data);
      },
    ),


  ],
);

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}


import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/route_name.dart';
import 'package:getx_mvvm/view/home/home_view.dart';
import 'package:getx_mvvm/view/login/login_view.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

class AppRoutes{

  static appRoutes() => [
    GetPage(name: RouteName.splashScreen,
        page:()=> const SplashScreen(),
        transitionDuration:const Duration(seconds: 10),
        transition: Transition.leftToRightWithFade),

    GetPage(name: RouteName.loginView,
        page:()=> const LoginView(),
        transitionDuration:const Duration(seconds: 10),
       // transition: Transition.leftToRightWithFade
    ),
    GetPage(name: RouteName.homeView,
        page:()=> const HomeView(),
        transitionDuration:const Duration(seconds: 10),
       // transition: Transition.leftToRightWithFade
    ),

  ];


}
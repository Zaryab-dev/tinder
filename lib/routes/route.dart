


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/common/global_var.dart';
import 'package:tinder/pages/auth_pages/splash_page.dart';
import 'package:tinder/pages/settings_pages/user_setting.dart';
import 'package:tinder/pages/user_details/user_detail_page.dart';

import '../pages/auth_pages/register_page.dart';
import '../pages/auth_pages/welcome_page.dart';
import '../pages/home_page/home_page.dart';

Route<ModalRoute> onGenerateRoute(RouteSettings settings) {
  switch(settings.name) {

    case '/':
      return MaterialPageRoute(builder: (context) => SplashPage());

    case '/login':
      return MaterialPageRoute(builder: (context) => WelcomePage());

    case '/register':
      return MaterialPageRoute(builder: (context) => RegisterPage());

    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());

    case '/setting':
      return MaterialPageRoute(builder: (context) => UserSettings());

    case '/details':
      return MaterialPageRoute(builder: (context) => UserDetailPage(data: settings.arguments as Map));

    default:
      return MaterialPageRoute(builder: (context) => WelcomePage());
  }
}
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guage/screens/checklist/checklist.dart';
import 'package:guage/screens/first_time_install/autochecklist.dart';
import 'package:guage/screens/first_time_install/finishsetup.dart';
import 'package:guage/screens/first_time_install/firstInstallation.dart';
import 'package:guage/screens/first_time_install/selfcheckup.dart';

import '../screens/login/login.dart';
import '../screens/otp/otp.dart';
import '../screens/register/register.dart';
import 'route.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return getPageRoute(
          settings: settings,
          view: const LoginScreen(),
        );

      case registerRoute:
        return getPageRoute(
          settings: settings,
          view: const RegisterScreen(),
        );

      case otpRoute:
        return getPageRoute(
          settings: settings,
          view: const OtpScreen(),
        );

      case checkListRoute:
        return getPageRoute(
          settings: settings,
          view: const CheckList(),
        );

      case firstInstallation:
        return getPageRoute(
          settings: settings,
          view: const FirstInstallation(),
        );
      case selfCheckup:
        return getPageRoute(
          settings: settings,
          view: SelfCheckup(),
        );
      case autoCheck:
        return getPageRoute(
          settings: settings,
          view: AutoCheckList(),
        );
 case finishSetup:
        return getPageRoute(
          settings: settings,
          view: FinishSetup(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}

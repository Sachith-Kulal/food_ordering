import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => const AuthenticationScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.ORDER_DETAILS,
      page: () => const OrderDetailsScreen(),
      binding: OrderDetailsControllerBinding(),
    ),
    GetPage(
      name: Routes.SUCESSFULL,
      page: () => const SucessfullScreen(),
      binding: SucessfullControllerBinding(),
    ),
  ];
}

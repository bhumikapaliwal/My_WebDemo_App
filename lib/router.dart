import 'package:auto_route/auto_route.dart';
import 'package:web_app/home_page.dart';
import 'package:web_app/second_page.dart';
import 'router.gr.dart'; // Import the generated file

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page, // Use generated route
      initial: true,
    ),
    AutoRoute(
      page: SecondRoute.page, // Use generated route
    ),
    AutoRoute(
      page: CartScreen.page, // Add CartScreen route
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // Optionally add route guards here
  ];
}

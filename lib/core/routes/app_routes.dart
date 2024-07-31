import 'package:auto_route/auto_route.dart';
import 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(page: FormRoute.page, initial: true)
      ];
}

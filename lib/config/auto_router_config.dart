import 'package:auto_route/auto_route.dart';

import '../pages/auth_page.dart';
import '../pages/main_page.dart';

part 'auto_router_config.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          // initial: true,
        ),
      ];
}

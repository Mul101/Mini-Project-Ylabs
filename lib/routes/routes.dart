import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mini_project/view/navigation_bar.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/navigation',
      page: () => MyNavigationBar(),
    ),
  ];
}

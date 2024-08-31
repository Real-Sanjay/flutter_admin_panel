import 'package:get/get.dart';
import '../../screens/login_screen.dart';
import '../../screens/registration_screen.dart';
import '../../screens/main/main_screen.dart';

class AppPages {
  static const INITIAL = '/login';

  static final routes = [
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/register', page: () => RegistrationScreen()),
    GetPage(name: '/home', page: () => MainScreen()),
  ];
}






// import 'package:get/get_navigation/src/routes/get_route.dart';
// import '../../screens/main/main_screen.dart';
//
//
//
// class AppPages {
//   static const HOME = '/';
//
//   static final routes = [
//     GetPage(
//       name: HOME,
//       fullscreenDialog: true,
//       page: () => MainScreen()
//     ),
//
//   ];
// }

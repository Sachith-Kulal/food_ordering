import 'package:firebase_auth/firebase_auth.dart';

class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    if (FirebaseAuth.instance.currentUser != null) {
      return HOME;
    }
    return AUTHENTICATION;
  }

  static const AUTHENTICATION = '/authentication';
  static const HOME = '/home';
  static const ORDER_DETAILS = '/order-details';
  static const SUCESSFULL = '/sucessfull';
}

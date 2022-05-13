import 'package:authentication/login.dart';

class UserInfoPro {
  String? name = "";
  void info() {
    if (user != null) {
      for (final providerProfile in user!.providerData) {
        name = providerProfile.displayName;
      }
    }
  }
}

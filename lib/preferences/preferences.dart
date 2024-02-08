import 'package:examen_practic_sim/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs; //objeto de tipo SharedPreferences

  static bool _checkbox =
      false; //variable de la cual queremos persistir el valor

  static User userEmmagatzema = User(
    email: '',
    password: '',
  );

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get checkbox {
    return _prefs.getBool('checkbox') ?? _checkbox;
  }

  static set checkbox(bool value) {
    _checkbox = value;
    _prefs.setBool('checkbox', value);
  }

  static User get user {
    final email = _prefs.getString('email') ?? '';
    final password = _prefs.getString('password') ?? '';
    return User(email: email, password: password);
  }

  static set user(User user) {
    _prefs.setString('email', user.email);
    _prefs.setString('password', user.password);
  }
}

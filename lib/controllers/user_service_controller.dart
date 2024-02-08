import 'package:examen_practic_sim/models/models.dart';
import 'package:get/get.dart';

class UserService extends GetConnect {
  final String _baseUrl =
      "https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app";
  List<UserFirebase> _users = [];
  late UserFirebase _tempUser;
  UserFirebase? _newUser;

  UserService() {
    //loadUsers();
  }

  List<UserFirebase> get users => _users;
  UserFirebase get tempUser => _tempUser;
  UserFirebase? get newUser => _newUser;

  set tempUser(UserFirebase user) {
    _tempUser = user;
  }

  set newUser(UserFirebase? user) {
    _newUser = user;
  }

  /* loadUsers() async {
    users.clear();
    final url = Uri.https(_baseUrl, 'users.json');
    final response = await http.get(url);
    final Map<String, dynamic> usersMap = json.decode(response.body);

    // Mapejam la resposta del servidor, per cada usuari, el convertim a la classe i l'afegim a la llista
    usersMap.forEach((key, value) {
      final auxUser = User.fromMap(value);
      auxUser.id = key;
      users.add(auxUser);
    });
  } */
}

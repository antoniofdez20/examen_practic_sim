import 'package:examen_practic_sim/widgets/user_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Examen Simulacro'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: AlignmentDirectional.centerEnd,
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                      child: GestureDetector(
                        child: UserCard(usuari: usuaris[index]),
                        onTap: () {
                          userService.tempUser = usuaris[index].copy();
                          Navigator.of(context).pushNamed('detail');
                        },
                      ),
                      onDismissed: (direction) {
                        if (usuaris.length < 2) {
                          userService.loadUsers();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'No es pot esborrar tots els elements!')));
                        } else {
                          userService.deleteUser(usuaris[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${userService.users[index].nom} esborrat')));
                        }
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

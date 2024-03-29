import '../models/models.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserFirebase usuari;
  const UserCard({super.key, required this.usuari});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(usuari.name)),
      title: Text(usuari.name),
      subtitle: Text(
        usuari.email,
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
    );
  }
}

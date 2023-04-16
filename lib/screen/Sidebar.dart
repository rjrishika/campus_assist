import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(),
        Text('User Name'),
        ListTile(
          leading: Icon(Icons.person_outline),
          trailing: Text('My Profile'),
        )
      ],
    );
  }
}

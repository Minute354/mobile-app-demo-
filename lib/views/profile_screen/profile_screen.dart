import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(onPressed: (){Navigator.pushNamed(context, '/signin');}, child: Text("Logout")));
  }
}
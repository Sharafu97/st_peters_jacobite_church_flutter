import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/screens/home/widgets/menu_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("St. Peter's Jacobite Syrian Orthodox Church"),
          Text('UNDER THE HOLY APOSTOLIC SEE OF ANTIOCH & ALL THE EAST'),
          Text('KINGDOM OF BAHRAIN'),
          MenuWidget()
        ],
      ),
    );
  }
}

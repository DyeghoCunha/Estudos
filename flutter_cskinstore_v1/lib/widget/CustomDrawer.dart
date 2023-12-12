import 'package:flutter/material.dart';
import 'package:flutter_cskinstore_v1/pages/UserPage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      elevation: 10,

      child: UserPage(),
    );
  }
}

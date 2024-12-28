import 'package:auth_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  Profilepage({super.key});

  final AuthService authService = AuthService();

  void logout() async {
    await authService.logout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffe7f1ff),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 2.0,
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: logout, icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(
          child: Text('Email:  ${authService.getEmail()}'),
        ),
      ),
    );
  }
}

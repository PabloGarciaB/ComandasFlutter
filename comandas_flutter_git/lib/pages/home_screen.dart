import 'package:comandas_flutter_git/pages/bienvenida_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Salir"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Sesion terminada");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            });
          },
        ),
      ),
    );
  }
}

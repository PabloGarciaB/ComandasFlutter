import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:comandas_flutter_git/reusable_widget/reusable_widget.dart';
import 'home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Crear cuenta",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("#F2F2F2"),
            hexStringToColor("#F2F2F2")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Ingresa un nombre de usuario",
                      Icons.person, false, _userTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Ingresa un correo electronico",
                      Icons.email_sharp, false, _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Ingresa una contraseña",
                      Icons.lock_clock_sharp, true, _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseButton(context, "Crear cuenta", () {
                    if (_emailTextController.text.isEmpty ||
                        _emailTextController.text.length < 1) {
                      Fluttertoast.showToast(
                          msg: "Ingresa un correo electronico válido",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 16);
                    } else if (_passwordTextController.text.isEmpty ||
                        _passwordTextController.text.length < 6) {
                      Fluttertoast.showToast(
                          msg: "Ingresa una contraseña mayor a 6 caracteres",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 16);
                    } else if (_userTextController.text.isEmpty ||
                        _userTextController.text.length < 4) {
                      Fluttertoast.showToast(
                          msg:
                              "Ingresa un nombre de usuario mayor a 4 caracteres",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black87,
                          fontSize: 16);
                    } else {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Cuenta creada");
                        Fluttertoast.showToast(
                            msg: "Cuenta creada, bienvenido",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black87,
                            fontSize: 16);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()} ");
                      });
                    }
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}

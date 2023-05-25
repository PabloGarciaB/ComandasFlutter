import 'package:comandas_flutter_git/pages/home_screen.dart';
import 'package:comandas_flutter_git/pages/reset_password.dart';
import 'package:comandas_flutter_git/pages/signup_screen.dart';
import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:comandas_flutter_git/reusable_widget/reusable_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("lib/res/bienvenido_logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Nombre de usuario", Icons.person, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contraseña", Icons.lock_clock_sharp, true,
                    _passwordTextController),
                const SizedBox(
                  height: 1,
                ),
                forgetPassword(context),
                firebaseButton(context, "Entrar", () {
                  if (_emailTextController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Ingresa un correo electronico válido",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.black87,
                        fontSize: 16);
                  } else if (_passwordTextController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Ingresa la contraseña ",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.white,
                        textColor: Colors.black87,
                        fontSize: 16);
                  } else if (FirebaseAuth.instance.currentUser == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const WelcomeScreen())));
                  } else {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error: ${error.toString()}");
                    });
                  }
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿No tienes cuenta? ",
            style: TextStyle(color: Colors.black87)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            "Crear cuenta",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "¿Olvidaste tu contraseña?",
        style: TextStyle(color: Colors.black87),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResetPassword())),
    ),
  );
}

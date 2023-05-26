import 'package:comandas_flutter_git/Provider/productos.dart';
import 'package:comandas_flutter_git/pages/bienvenida_login.dart';
import 'package:comandas_flutter_git/pages/home_screen.dart';
import 'package:comandas_flutter_git/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ProductosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chefsito',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: hexStringToColor('#000000')),
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
        ),
      );
}

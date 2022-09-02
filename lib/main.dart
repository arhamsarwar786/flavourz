import 'package:firebase_core/firebase_core.dart';
import 'package:flavourz/Utils/constant.dart';
import 'package:flavourz/controllers/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>.value(value: MenuProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: primary),
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

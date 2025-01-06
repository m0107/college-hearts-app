import 'package:college_hearts/screens/homeLayout/homeLayout.dart';
import 'package:college_hearts/screens/login/backend.dart';
import 'package:college_hearts/screens/login/providers/phone.dart';
import 'package:college_hearts/screens/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'authWrapper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider<PhoneAuthentication>(create: (_) => PhoneAuthentication()),
          ChangeNotifierProvider<Authentication>(create: (_) => Authentication()),
        ],
  child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthWrapper(),
        ))

      );
}


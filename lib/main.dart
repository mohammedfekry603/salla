import 'package:flutter/material.dart';
import 'package:salla/constant/app_router.dart';
import 'package:salla/data/diohelper/diohelper.dart';
import 'package:salla/presentation/screens/onboarding_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: const OnBoardingScreen(),
    );
  }
}
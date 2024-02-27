import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:totem/app/presentation/home/home_page.dart';
import 'package:totem/app/presentation/home/home_provider.dart';
import 'package:totem/app/presentation/splash/splash_page.dart';

class Totem extends StatelessWidget {
  const Totem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Totem',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}

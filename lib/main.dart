import 'package:assignmenttwo/screens/homescreen.dart';
import 'package:assignmenttwo/screens/menuscreen/providers/card_provider.dart';
import 'package:assignmenttwo/screens/menuscreen/providers/checkout_provider.dart';
import 'package:assignmenttwo/screens/menuscreen/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers:[
       ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
      ChangeNotifierProvider(create: (_)=> CardProvider()),
      ChangeNotifierProvider(create: (_)=> CardCheckoutProvider())
    ],
    child: const MaterialApp(
     home: HomeScreen(),
    )
  );
}

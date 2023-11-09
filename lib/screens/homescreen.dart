import 'package:assignmenttwo/screens/menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/start.jpg"), 
          fit: BoxFit.cover
          ),
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Image(image: AssetImage('assets/images/restaurant.png'),
           color: Colors.white,
           width: 100,
           ),
           const Padding(
             padding: EdgeInsets.only(top:20),
             child: Text("Your Own Resturent",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20, color: Colors.white),
             ),
           ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          ),
            onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Menuscreen()),
              );
            },
            child:  const Text('Go To Menu'),
          ),
        ],
      )
    );
  }
}
import 'package:assignmenttwo/screens/menuscreen/providers/favorite_provider.dart';
import 'package:flutter/material.dart';


class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalFavorite = provider.favorites;
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Watch List'),
      ),
      body:  Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Favorites",
                  style: TextStyle(fontSize: 27,color: Colors.white , fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalFavorite.length,
              itemBuilder:(context ,index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    
                    title: Text(
                      finalFavorite[index].name,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    subtitle:  Text(
                      finalFavorite[index].description,
                      style: const TextStyle(color: Colors.white,fontSize: 10),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(finalFavorite[index].images),
                      backgroundColor: Colors.white,
                    ),
                  ),
                );
              }
            ),
          ),
        ]
      ),
    );
  }
}
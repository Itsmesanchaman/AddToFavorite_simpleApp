import 'package:favoriteitemshow/favoriteitem/favoriteItem.dart';
import 'package:favoriteitemshow/provider/itemprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final favoriteAddedItem = Provider.of<ItemProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Favorite App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteItem()),
              );
            },
            child: const Icon(Icons.favorite, color: Colors.red),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: objects.length,
              itemBuilder: (context, index) {
                final currentTile = objects[index];
                return ListTile(
                  onTap: () {
                    if (favoriteAddedItem.selectedItem.contains(index)) {
                      favoriteAddedItem.removeItem(index);
                    } else {
                      favoriteAddedItem.addItem(index);
                    }
                  },
                  leading: CircleAvatar(
                    child: Image.asset(currentTile.image,),
                  ),
                  title: Text(currentTile.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(currentTile.subTitle),
                  trailing: Icon(favoriteAddedItem.selectedItem.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: favoriteAddedItem.selectedItem.contains(index) ? Colors.red : null,),
                );

              },
            ),

          ),
        ],
      ),
    );
  }
}

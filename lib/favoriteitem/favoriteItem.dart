import 'package:favoriteitemshow/constant/tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/itemprovider.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {

    final favoriteAddedItem = Provider.of<ItemProvider>(context);

    List selectedItems = objects.asMap()
    .entries
    .where((entry) => favoriteAddedItem.selectedItem.contains(entry.key))
    .map((entry) => entry.value)
    .toList();

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(title: const Text('Your Favorite Item'),centerTitle: true,
      backgroundColor: Colors.black12,
      ),
      body: selectedItems.isEmpty
        ? const Center(
        child:  Text('You have nothing selected.', style: TextStyle(fontWeight: FontWeight.bold),),
      )
          :Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: selectedItems.length,
              itemBuilder: (context, index){

                final favItem = selectedItems[index];
                
                
                return ListTile(
                  onTap: (){
                    if(favoriteAddedItem.selectedItem.contains(index)){
                      favoriteAddedItem.removeItem(index);
                    }else{
                      favoriteAddedItem.addItem(index);
                    }

                  },
                  leading: CircleAvatar(
                    child: Image.asset(favItem.image),

                  ),
                  title: Text(favItem.title),
                  subtitle: Text(favItem.subTitle),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){

                      int itemIndex = objects.indexOf(favItem);


                      favoriteAddedItem.removeItem(itemIndex);
                    },
                  )


                );
              }))
        ],
      ),

    );
  }
}

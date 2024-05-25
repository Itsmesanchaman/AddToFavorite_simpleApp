import 'package:favoriteitemshow/provider/itemprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constant/tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(addItemProvider);
    final favoriteIcon = ref.watch(changeIcon);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text('Add to Favorite'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: objects.length,
              itemBuilder: (context, index) {
                final currentTile = objects[index];
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(currentTile.image),
                    ),
                    title: Text(
                      currentTile.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(currentTile.subTitle),
                    trailing: IconButton(
                        onPressed: () {
                          if (state.contains(currentTile)) {
                            ref
                                .read(addItemProvider.notifier)
                                .state
                                .remove(currentTile);
                          } else {
                            ref
                                .read(addItemProvider.notifier)
                                .state
                                .add(currentTile);
                          }
                        },
                        icon: state.contains(currentTile)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border_outlined)));
              },
            ),
          ),
        ],
      ),
    );
  }
}

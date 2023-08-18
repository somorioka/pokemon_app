import 'package:flutter/material.dart';

import 'poke_listitem.dart';

class PokeList extends StatelessWidget {
  const PokeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: 10000,
      itemBuilder: (context, index){
        return PokeListItem(index: index);
      }
      );
  }
}
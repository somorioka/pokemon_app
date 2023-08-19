import 'package:flutter/material.dart';
import 'package:pokemon_app/const/pokeapi.dart';
import 'package:pokemon_app/models/pokemon_notifier.dart';
import 'package:provider/provider.dart';

import 'poke_listitem.dart';

class PokeList extends StatefulWidget {
  const PokeList({
    super.key,
  });

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int more = 30;
  int pokeCount = more;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonsNotifier>(
      builder: (context, pokes, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        itemCount: pokeCount + 1,
        itemBuilder: (context, index){
          if (index == pokeCount){
            return OutlinedButton(
              onPressed: () => {
                setState((){
                  pokeCount = pokeCount + more;
                  if (pokeCount > pokeMaxId){
                    pokeCount = pokeMaxId;
                  }
                } 
                )
              }, 
              child: const Text('more')
              );
          }else{
            return PokeListItem(
            poke: pokes.byId(index + 1),
          );
          }
        }
        ),
    );
  }
}
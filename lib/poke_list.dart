import 'package:flutter/material.dart';
import 'package:pokemon_app/const/pokeapi.dart';
import 'package:pokemon_app/models/pokemon_notifier.dart';
import 'package:provider/provider.dart';

import 'models/poke_favorite.dart';
import 'poke_listitem.dart';

class PokeList extends StatefulWidget {
  const PokeList({
    super.key,
  });

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int pageSize = 30;
  bool isFavoriteMode = false;
  int _currentPage = 1;

  int itemCount(int page){
    int ret = page * pageSize;
    if (isFavoriteMode && ret > favMock.length){
      ret = favMock.length;
    }
    if (ret > pokeMaxId){
      ret = pokeMaxId;
    }
    return ret;
  }

  int itemId (int index) {
    int ret = index + 1;
    if (isFavoriteMode) {
      ret = favMock[index].pokeId;
    }
    return ret;
  }

  bool isLastPage(int page){
    if (isFavoriteMode){
      if(_currentPage * pageSize < favMock.length){
        return false;
      }
      return true;
    }else{
      if (_currentPage * pageSize < pokeMaxId){
        return false;
      }
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          height: 24,
          child: IconButton(onPressed: () => {setState(() => isFavoriteMode = !isFavoriteMode)},
          icon: isFavoriteMode 
          ? const Icon(Icons.star, color: Colors.orangeAccent)
          : const Icon(Icons.star_outline)),
          ),
        Expanded(
          child: Consumer<PokemonsNotifier>(
            builder: (context, pokes, child) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            itemCount: itemCount(_currentPage) + 1,
            itemBuilder: (context, index){
              if (index == itemCount(_currentPage)){
                return OutlinedButton(
                  onPressed: isLastPage(_currentPage)
                  ? null 
                  :() => {
                    setState(() => _currentPage++)
                  }, 
                  child: const Text('more')
                  );
              }else{
                return PokeListItem(
                poke: pokes.byId(itemId(index)),
              );
              }
            }
            ),
              ),
        ),
      ],
    );
  }
}
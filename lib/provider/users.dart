import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:learning_provide/data/dummy_user.dart';
import 'package:learning_provide/models/user.dart';

class Users with ChangeNotifier
{
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }
  int get count {return _items.length;}

  User byIndex(int index){
    return _items.values.elementAt(index);
  }

  void put(User user){
    
    if(user.id != null && user.id.trim().isNotEmpty &&
          _items.containsKey(user.id))
    {
      _items.update(user.id, (_) => User(user.id, user.name, user.email, user.avatarUrl));
    }else {
      var rng = Random().nextInt(1000);
      _items.putIfAbsent('$rng', () => User('$rng', user.name, user.email, user.avatarUrl));
    }

    notifyListeners();
  }

  void removeElement(User user){
    if(user != null && _items.containsKey(user.id))
    {
      _items.remove(user.id);
    }
    notifyListeners();
  }
}
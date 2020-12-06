import 'package:flutter/material.dart';
import 'package:providers_example/Item.dart';

class ItemAddNotifier extends ChangeNotifier{
  List<Item> itemList = [];

  addItem(String itemName) async{
    Item item = Item(itemName);
    itemList.add(item);
    notifyListeners();
  }

  updateItem(int index, String itemName) async{
    Item item = Item(itemName);
    itemList.elementAt(index).itemName = item.itemName;
    notifyListeners();
  }

  deleteItem(int index) async{
    itemList.removeAt(index);
    notifyListeners();
  }

}
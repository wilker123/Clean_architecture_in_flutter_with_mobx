import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_with_mobx/models/item_model.dart';

class HomeController {
  @observable
  List<ItemModel> listItems = [
    ItemModel(title: "item 1", check: false),
    ItemModel(title: "Item 2", check: true),
    ItemModel(title: "Item 3", check: false)
  ];

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }
}

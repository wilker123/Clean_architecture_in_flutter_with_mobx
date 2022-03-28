import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_with_mobx/models/item_model.dart';

class HomeController {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "item 1", check: false),
    ItemModel(title: "Item 2", check: true),
    ItemModel(title: "Item 3", check: false)
  ].asObservable();

  @action
  addItem(ItemModel model) {
    listItems.add(model);
  }

  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }
}

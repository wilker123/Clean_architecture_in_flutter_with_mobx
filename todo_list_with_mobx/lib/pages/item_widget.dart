import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;

  const ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title),
          leading: Checkbox(
            value: item.check,
            onChanged: (value) {
              item.setCheck(value!);
            },
          ),
          trailing: IconButton(
            color: Colors.red,
            icon: const Icon(Icons.remove_circle),
            onPressed: () {},
          ),
        );
      },
    );
  }
}

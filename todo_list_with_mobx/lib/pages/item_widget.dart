import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Título'),
      leading: Checkbox(
        value: true,
        onChanged: (value) {},
      ),
      trailing: IconButton(
        color: Colors.red,
        icon: Icon(Icons.remove_circle),
        onPressed: () {},
      ),
    );
  }
}

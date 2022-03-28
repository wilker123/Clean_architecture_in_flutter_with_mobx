import 'package:flutter/material.dart';

import 'item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _dialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Adicionar item"),
          content: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Novo item'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Salva"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Cancelar"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "Pesquisa..."),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return ItemWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}

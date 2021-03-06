import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/home_controller.dart';
import '../models/item_model.dart';
import 'item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Adicionar item"),
          content: TextField(
            onChanged: model.setTitle,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Novo item'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.addItem(model);
                Navigator.of(context).pop();
              },
              child: const Text("Salva"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
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
          onChanged: (value) {
            controller.setFilter(value);
          },
          decoration: const InputDecoration(hintText: "Pesquisa..."),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Observer(
              builder: (_) {
                return Text("${controller.totalChecked}");
              },
            ),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.listFiltered.length,
            itemBuilder: (_, index) {
              var item = controller.listFiltered[index];
              return ItemWidget(
                item: item,
                removeClicked: () {
                  controller.removeItem(item);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}

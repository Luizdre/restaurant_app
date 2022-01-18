import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/app/modules/supplies/supplies_store.dart';
import 'package:restaurant/helpers/supplies/model/supplieModel.dart';

// ignore: use_key_in_widget_constructors
class Supplies extends StatefulWidget {
  @override
  _SuppliesState createState() => _SuppliesState();
}

class _SuppliesState extends ModularState<Supplies, SuppliesStore> {
  @override
  void initState() {
    store.getSupplie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.homeStore.socket.on('Supplie Alterado', (data) {
      store.supplieList.clear();
      for (var item in data) {
        SupplieModel supplie = SupplieModel.fromJson(item);
        store.supplieList.add(supplie);
      }
      store.supplieList.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      store.controller.add(store.supplieList);
    });
    return Expanded(
      child: StreamBuilder(
          stream: store.controller.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                    itemCount: store.supplieList.length,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${index + 1} - ' +
                                    store.supplieList[index].name!),
                                IconButton(
                                    onPressed: () => store.deleteSupplie(
                                        store.supplieList[index]),
                                    icon: const Icon(
                                      FontAwesomeIcons.trash,
                                      size: 20,
                                      color: Colors.redAccent,
                                    ))
                              ],
                            ),
                          ),
                        ));
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
    
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    
    final List<Widget> options = [];

    data.forEach((option) {
      
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {

          Navigator.pushNamed(context, option['ruta']);

          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );

          // Navigator.push(context, route);
        },
      );

      options..add(widgetTemp)
             ..add(Divider());
    });

    return options;
    
  }
}

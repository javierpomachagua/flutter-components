import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Abigail', 'Gloria', 'Germán', 'Enzo', 'Jack', 'Bonnie'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
        body: ListView(children: _createShortItems()));
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (var item in options) {
      final tempWidget = ListTile(title: Text(item));

      list..add(tempWidget)..add(Divider());
    }

    return list;
  }

  List<Widget> _createShortItems() {

    var widgets = options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('<3'),
            leading: Icon(Icons.assignment_ind),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
  
}

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listNumbers = new List();
  int _lastItem = 0;

  @override
  void initState() {
    super.initState();
    _add10();
    _add10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print('LLEGÓ');
        _add10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
      ),
      body: _createList()
    );
  }

  Widget _createList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listNumbers.length,
      itemBuilder: (BuildContext context, int index) {

        final image = _listNumbers[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  _add10() {

    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }

  }

}
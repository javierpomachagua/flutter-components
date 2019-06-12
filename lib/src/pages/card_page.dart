import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0),
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }

  Widget _cardType1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(Icons.photo, color: Colors.blue),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text('Aquí estamos en el texto de esta tarjeta, descripción de la tarjeta, larga descripción'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {

    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://propane.com/wp-content/uploads/2018/10/Propane-Uses-Landscape-And-Turf-Management-Marquee-1800x1200-Mower-Vista.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://propane.com/wp-content/uploads/2018/10/Propane-Uses-Landscape-And-Turf-Management-Marquee-1800x1200-Mower-Vista.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner')
          )
        ],
      ),
    );

    return Container(      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );

  }
}
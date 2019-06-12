import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a-/AAuE7mA-1-hmxRrda34IbwcO11V0sNJIJyAtdtnWxnMBhQ=s96'),
            radius: 25.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
              
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://scontent.flim12-1.fna.fbcdn.net/v/t1.0-9/57502866_430604830846484_2390437440989954048_n.jpg?_nc_cat=105&_nc_ht=scontent.flim12-1.fna&oh=14dd731a61e8cb170115865e57cc4f55&oe=5D518559'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  
  }

}
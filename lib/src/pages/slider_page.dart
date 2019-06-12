import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 80.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: !_blockCheck ? null : (value) {
        setState(() {
          _valueSlider = value;
        });
      },      
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://i.ytimg.com/vi/T-GI4Qo7ves/maxresdefault.jpg'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (value) {
    //     setState(() {
    //       _blockCheck = value;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
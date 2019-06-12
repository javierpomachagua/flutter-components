import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _name = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  List<String> _poderes = ['Volar', 'Rayo X', 'Super Aliento', 'Super Fuerza'];
  String _opcionSeleccionada = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras 0'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() => _name = valor);
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras 0'),
        hintText: 'Email de la persona',
        labelText: 'Email',
        helperText: 'Sólo es el email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() => _email = valor);
      },
    );
  }  

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras 0'),
        hintText: 'Password de la persona',
        labelText: 'Password',
        helperText: 'Sólo es el password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) {
        setState(() => _password = valor);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),        
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2019),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }
  
  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOptionsDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre : $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  


}
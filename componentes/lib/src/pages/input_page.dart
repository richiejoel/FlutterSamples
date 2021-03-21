import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre='', _email='', _fecha='';
  String _opcSeleccionada = 'Volar';
  TextEditingController _inputField = new TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Fuerza', 'Super Aliento'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
           Divider(),
           _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
           _crearDropDown(),
           Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

 Widget _crearInput() {
   return TextField(
     //autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ) ,
      counter: Text('Letras ${_nombre.length}'),
      hintText: 'Nombre de la persona',
      labelText: 'Nombre',
      helperText: 'Sólo es el nombre',
      suffixIcon: Icon(Icons.accessibility),
      icon: Icon(Icons.account_circle)
    ),
    onChanged: (valor){
      setState(() {
        _nombre = valor;
      });
      
    },
   );
 }

 Widget _crearEmail(){
   return TextField(
     //autofocus: true,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ) ,
      hintText: 'Email',
      labelText: 'Email',
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email)
    ),
    onChanged: (valor) => setState(() {
        _email = valor;
      })
      
   );
 }

 Widget _crearPassword(){
   return TextField(
     //autofocus: true,
    obscureText: true,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ) ,
      hintText: 'Password',
      labelText: 'Password',
      suffixIcon: Icon(Icons.lock_open),
      icon: Icon(Icons.lock)
    ),
    onChanged: (valor) => setState(() {
        _email = valor;
      })
      
   );
 }

 Widget _crearFecha(BuildContext context){
   return TextField(
     //autofocus: trueobscureText: true,
    enableInteractiveSelection: false,
    controller: _inputField,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      ) ,
      hintText: 'Fecha de nacimiento',
      labelText: 'Fecha de nacimiento',
      suffixIcon: Icon(Icons.perm_contact_calendar),
      icon: Icon(Icons.calendar_today)
    ),
    onTap: (){
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
    },
      
   );
 }

 _selectDate(BuildContext context) async {
   DateTime picked = await showDatePicker(
     context: context,
     initialDate: new DateTime.now(),
     firstDate: new DateTime(2018),
     lastDate: new DateTime(2030),
     locale: Locale('es', 'ES')
   );

   if(picked != null){
     setState(() {
       _fecha = picked.toString();
       _inputField.text = _fecha;
     });
   }
 }

List<DropdownMenuItem<String>> getOpcionesCombo() {
  List<DropdownMenuItem<String>> lista = new List();
  _poderes.forEach((poder){
      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
  });
  return lista;
}

 Widget _crearDropDown(){

   return Row(
     children: <Widget>[
       Icon(Icons.select_all),
       SizedBox(width: 30.0),
       Expanded(
          child: DropdownButton(
          value: _opcSeleccionada,
          items: getOpcionesCombo(),
          onChanged:(opt){
            setState(() {
              _opcSeleccionada = opt;
            });
          }
        ),
      )
     ],

   );
   
 }


 Widget _crearPersona(){
   return ListTile(
     title: Text('Nombre es: $_nombre'),
     subtitle: Text('Email es: $_email'),
     trailing: Text(_opcSeleccionada),
   );
 }

}
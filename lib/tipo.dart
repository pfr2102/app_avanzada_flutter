import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TipoDieta {mediterranea, vegetariana, vegana, hipocalorica}

class Tipo extends StatefulWidget {
  const Tipo({Key? key}) : super(key: key);

  @override
  _TipoState createState() => _TipoState();
}

class _TipoState extends State<Tipo> {
  TipoDieta _status = TipoDieta.vegetariana;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(45),
      children: [
        Text("Escoge el tipo de dieta", style:TextStyle(fontSize: 30, color: Colors.green) , textAlign: TextAlign.center,),
        SizedBox(height: 20),
        Text("escoge las que mas se te acomode",style:TextStyle(fontSize: 20, color: Colors.blue) , textAlign: TextAlign.center,),
        SizedBox(height: 30),
        Image.asset("assets/logo.png", width: 150, height: 150 ),
        SizedBox(height:20),
        RadioListTile(
          title: Text("Dieta vegetariana", style: TextStyle(fontSize: 20),),
          value: TipoDieta.vegetariana,
          groupValue: _status,
          onChanged: (TipoDieta? valor ){
          setState(() {
            _status = valor!;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Has escogido una dieta de tipo vegetariana"), duration: Duration(milliseconds: 1500),));
          });
        }),
        //--------------------------------------------------------------------
        RadioListTile(
            title: Text("Dieta mediterranea", style: TextStyle(fontSize: 20),),
            value: TipoDieta.mediterranea,
            groupValue: _status,
            onChanged: (TipoDieta? valor ){
              setState(() {
                _status = valor!;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Has escogido una dieta de tipo mediterranea"), duration: Duration(milliseconds: 1500)));
              });
            }),
        //--------------------------------------------------------------------
        RadioListTile(
            title: Text("Dieta hipocalorica", style: TextStyle(fontSize: 20),),
            value: TipoDieta.hipocalorica,
            groupValue: _status,
            onChanged: (TipoDieta? valor ){
              setState(() {
                _status = valor!;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Has escogido una dieta de tipo hipocalorica"), duration: Duration(milliseconds: 1500)));
              });
            }),
        //--------------------------------------------------------------------
        RadioListTile(
            title: Text("Dieta vegana", style: TextStyle(fontSize: 20),),
            value: TipoDieta.vegana,
            groupValue: _status,
            onChanged: (TipoDieta? valor ){
              setState(() {
                _status = valor!;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Has escogido una dieta de tipo vegana"), duration: Duration(milliseconds: 1500)));
              });
            }),
        //--------------------------------------------------------------------
      ],
    );
  }
}

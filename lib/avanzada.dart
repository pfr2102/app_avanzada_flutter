import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dieta.dart';
import 'inicio.dart';
import 'tipo.dart';


class Avanzada extends StatefulWidget {
  const Avanzada({Key? key}) : super(key: key);

  @override
  _AvanzadaState createState() => _AvanzadaState();
}

class _AvanzadaState extends State<Avanzada> {
  //ATRIBUTOS
  int _indice = 0;

  //METODOS
  //-------------------------------------------
  void alert({String titulo = 'Título', String descripcion = 'contenido del mensaje.', String boton = 'Aceptar'}){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(descripcion),
          actions: <Widget>[
            TextButton(
              child: Text(boton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


 void cambiarPagina(int indice){
  setState(() {
    _indice = indice;
  });
 }



 final List<Widget>_paginas = [
    Inicio(),
    Dieta(),
    Tipo()
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avanzada",),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){alert(titulo: "HOLA", descripcion: "esta es la app avanzada");},
                icon: Icon(Icons.add_circle),
                iconSize: 40,
            )
          ]
          ),

        body: _paginas[_indice],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Inicio"),
            BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "dieta"),
            BottomNavigationBarItem(icon: Icon(Icons.assessment_rounded), label: "Tipo"),
          ],
          iconSize: 30,
          currentIndex: _indice,
          onTap: cambiarPagina ,
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
        ),
    );
  }
}

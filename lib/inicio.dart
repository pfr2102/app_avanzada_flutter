import 'package:dam_app_avanzada_19400568/dieta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dieta.dart';
class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  // ATRIBUTOS
  // METODOS
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


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [
        Image.asset('assets/logo.png',width: 150, height: 150,),
        SizedBox(height: 30),
        Text("Bienvenido a tu App Fit", style: TextStyle(fontSize: 30, color: Colors.green), textAlign: TextAlign.center,),
        Text("Alimentate bien para tener una mejor vida",style: TextStyle(fontSize: 17, color: Colors.blue), textAlign: TextAlign.center,),
        SizedBox(height: 30),
        OutlinedButton(onPressed: (){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Se constante con las dietas porque de otra forma puede ser peligroso para tu salud dejar la dieta de un dia para otro")));
        }, child:Padding(padding: EdgeInsets.all(10), child: Text("Recomendaciones", style: TextStyle(fontSize: 20),),) ,
        ),
        SizedBox(height:10),
        TextButton(onPressed: (){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Para esto desplazate por el menu a la opcion que dice dieta")));
        }, child: Padding(padding: EdgeInsets.all(10), child: Text("Crear tu propia dieta", style: TextStyle(fontSize: 15, color: Colors.blueAccent),),))


      ],
    );
  }
}

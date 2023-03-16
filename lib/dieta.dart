import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Dieta extends StatefulWidget {
  const Dieta({Key? key}) : super(key: key);

  @override
  _DietaState createState() => _DietaState();
}

class _DietaState extends State<Dieta> {
  //ATRIBUTOS
  String? _rangoEdades;
  final _nombre = TextEditingController();
  final _edad = TextEditingController();
  final _peso = TextEditingController();

  //METODOS
  List<DropdownMenuItem<String>> _listaDeOpciones = [
    DropdownMenuItem<String>(
      value: '1',
      child: Text('De 10 a 17 años'),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text('De 18 a 25 años'),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text('De 26 o mas'),
    ),
  ];
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
  //------------------------------------------
  void crearDieta(){
    String dieta = "";
    double peso;
    //para verificar que sea un valor numerico antes de hacer la conversion
    if(double.tryParse(_peso.text.replaceAll(',', '.')) == null){
      alert(titulo: 'Error', descripcion: 'Ingresa valores numéricos para el peso');
      return;
    }
    //si es un valor valido hacemos ahora si la conversion
    peso = double.parse(_peso.text.replaceAll(',', '.'));

    if(_rangoEdades == '1' && peso>=65){
      dieta="Si estas pasado de peso para estar en una edad de 10 a 17 años asi que te recomendamos hacer la siguiente dieta: \n \n *dieta imaginaria";
    }else if(_rangoEdades == '1' && peso<65){dieta="Para tu rango de edad de 10 a 17 años no tienes sobrepeso asi que engorda mas para que uses esta app";}
    else if(_rangoEdades == '2' && peso>=85){
      dieta="Si estas pasado de peso para estar en una edad de 18 a 25 años asi que te recomendamos hacer la siguiente dieta: \n \n *dieta imaginaria";
    }else if(_rangoEdades == '2' && peso<85){dieta="Para tu rango de edad de 18 a 25 años no tienes sobrepeso asi que engorda mas para que uses esta app";}
    else if(_rangoEdades == '2' && peso>=90){
      dieta="Si estas pasado de peso para tener una edad mayor a 25 años asi que te recomendamos hacer la siguiente dieta: \n \n *dieta imaginaria";
    }else if(_rangoEdades == '2' && peso<90){dieta="Para tu edad que es mayor a 25 años no tienes sobrepeso asi que engorda mas para que uses esta app";}
    else{alert(titulo: 'Hola ${_nombre.text}: ', descripcion: 'no has ingresado los datos correctamente'); return;}
    alert(titulo: 'Hola ${_nombre.text}: ', descripcion: dieta);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(

      padding: EdgeInsets.all(60),
      children: [
        Text("CREA TU DIETA", style: TextStyle(fontSize: 30, color: Colors.orange), textAlign: TextAlign.center,),
        Text("AGREGA TUS DATOS PERSONALES", style: TextStyle(fontSize: 15, color: Colors.blueAccent), textAlign: TextAlign.center, ),
        SizedBox(height: 30,),
        //Image.asset('assets/logo.png',width: 150, height: 150,),
        SizedBox(height: 30,),
        TextField(controller: _nombre, decoration: InputDecoration(labelText: "Nombre", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),),
        SizedBox(height: 20,),
        TextField(controller: _peso, decoration: InputDecoration(labelText: "Tu peso en kl", border: OutlineInputBorder(), prefixIcon: Icon(Icons.accessibility_sharp)),),
        SizedBox(height: 20,),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
              labelText: "Selecciona  tu rando de edad",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person_outline)
          ),
          items: _listaDeOpciones,
          value: _rangoEdades,
          onChanged: (String? valor) {
            setState(() {
              _rangoEdades = valor;
            });
          },
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){crearDieta();}, child: Padding(padding: EdgeInsets.all(15) ,child: Text("Crear dieta", style: TextStyle(fontSize: 20),),),)
      ],

    );
  }
}

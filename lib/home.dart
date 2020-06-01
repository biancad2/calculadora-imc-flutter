import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  TextEditingController controllerAltura = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();

  String msgResult = "Índice de massa corporal";

  void calcular() {
    double peso = double.parse(controllerPeso.text);
    double altura = double.parse(controllerAltura.text);
    double imc = peso / (altura * altura);
    if (peso == null || altura == null) {
      setState(() {
        msgResult = "digite os valores corretamente!!";
      });
    } else {
      if (imc <= 18.5) {
        setState(() {
          msgResult = "Magreza";
        });
      } else {
        if (imc <= 24.9) {
          setState(() {
            msgResult = "Normal";
          });
        } else {
          if (imc <= 29.9) {
            setState(() {
              msgResult = "Sobrepeso";
            });
          } else {
            if (imc <= 39.9) {
              setState(() {
                msgResult = "Obesidade";
              });
            } else {
              if (imc >= 40) {
                setState(() {
                  msgResult = "Obesidade grave";
                });
              } else {
                setState(() {
                  msgResult = "Erro";
                });
              }
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/calculadora3.png"),
                                fit: BoxFit.fill))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        msgResult,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Digite seu peso...',
                        prefixIcon: Icon(Icons.fitness_center),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2),
                        ),
                      ),
                      controller: controllerPeso,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                      keyboardType:TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Digite sua altura...',
                        prefixIcon: Icon(Icons.accessibility),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple, width: 2),
                        ),
                      ),
                      controller: controllerAltura,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 25),
                    ),
                    onPressed: calcular,
                  )
                ],
              ),
            )));
  }
}

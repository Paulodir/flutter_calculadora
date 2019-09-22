import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Resultado: ?";
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  void somar() {
    if (isNumeric(num1Controller.text) && isNumeric(num2Controller.text)) {
      setState(() {
        double num1 = double.parse(num1Controller.text);
        double num2 = double.parse(num2Controller.text);
        double resultado = num1 + num2;
        _infoText = "Resultado: (${resultado.toString()})";
      });
    } else {
      _showDialog("Aviso", "apenas numeros");
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //retorna um objeto do tipo dialog
          return AlertDialog(
            title: new Text(title),
            content: new Text(message),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void diminuir() {
    setState(() {
      double num1 = double.parse(num1Controller.text);
      double num2 = double.parse(num2Controller.text);
      double resultado = num1 - num2;
      _infoText = "Resultado: (${resultado.toString()})";
    });
  }

  void multiplicar() {
    setState(() {
      //_infoText= "sadojwsijfgisjgfisjd";
      double num1 = double.parse(num1Controller.text);
      double num2 = double.parse(num2Controller.text);
      double resultado = num1 * num2;
      _infoText = "Resultado: (${resultado.toString()})";
    });
  }

  void dividir() {
    setState(() {
      double num1 = double.parse(num1Controller.text);
      double num2 = double.parse(num2Controller.text);
      double resultado = num1 / num2;
      _infoText = "Resultado: (${resultado.toString()})";
    });
  }

  void resetFilds() {
    num1Controller.text = "";
    num2Controller.text = "";
    setState(() {
      _infoText = "Resultado: ?";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              resetFilds();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Número 1",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
                style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                controller: num1Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Preencha o Numero 1";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Número 2",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
                style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                controller: num2Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Preencha o Número 2";
                  }
                },
              ),
              ButtonTheme.bar(
                child:
                    ButtonBar(
                        alignment: MainAxisAlignment.center, children: <
                        Widget>[
                          RaisedButton(
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                somar();
                                FocusScope.of(context).requestFocus(new FocusNode());
                              }},
                            color: Colors.blueGrey,
                            child: Text("+",style: TextStyle(color: Colors.white, fontSize: 25.0),
                            ),
                          ),
                      RaisedButton(
                        onPressed: () {
                      if (_formkey.currentState.validate()) {
                        diminuir();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        multiplicar();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      "X",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        dividir();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      "/",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ]),
              ),
              Text(
                _infoText,
                style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

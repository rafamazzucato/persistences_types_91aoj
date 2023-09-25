import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistences_types/firebase/models/car.dart';

class FormCarWidget extends StatelessWidget {
  FormCarWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();

  _insertCar(Car c) async{
    await FirebaseFirestore.instance.collection("cars").add(c.toJson());
  }

  @override
  Widget build(BuildContext context) {
    const title = Text("Novo Carro");
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration( hintText: "Marca", labelText: "Marca"),
                controller: _marcaController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Marca inválida";
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration( hintText: "Modelo", labelText: "Modelo"),
                controller: _modeloController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Modelo inválido";
                  }

                  return null;
                },
              ),
              Padding(padding: const EdgeInsets.only(top: 12), 
                child: ElevatedButton(
                  child: const Text("Salvar"), 
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      final car = Car(_marcaController.text, _modeloController.text);
                      _insertCar(car);
                      Navigator.pop(context);
                    }
                  }))
            ]))),
    );
  }
}
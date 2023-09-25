import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistences_types/commons/list_item.dart';
import 'package:persistences_types/commons/constants.dart';
import 'package:persistences_types/firebase/models/car.dart';
import 'package:persistences_types/firebase/screens/form_car.dart';

class ListCarsWidget extends StatefulWidget {
  const ListCarsWidget({super.key});

  @override
  State<ListCarsWidget> createState() => _ListCarsWidgetState();
}

class _ListCarsWidgetState extends State<ListCarsWidget> {

  List<Car> cars = [];

  @override
  Widget build(BuildContext context) {
    const title = Text("Carros");
    final formCar = FormCarWidget();
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [IconButton(
          icon: addIcon,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => formCar));
          })],),
      body: buildList(context),
    );
  }

  Widget buildList(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("cars").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return const LinearProgressIndicator();
        if(snapshot.data == null || snapshot.data!.size == 0){
          return const Center(
            child: Text("Nenhum carro encontrado!"),
          );
        }else{
          return buildListView(context, snapshot.data!.docs);
        }
      });
  }

  Widget buildListView(BuildContext context, List<QueryDocumentSnapshot> snapshots){
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: snapshots.map((data) => _buildItem(context, data)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, QueryDocumentSnapshot data){
    Car c = Car.fromSnapshot(data);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListItemWidget(leading: "", title: c.marca, subtitle: 
        c.modelo,onLongPress: () async{
          await data.reference.delete();
        }));
  }
}
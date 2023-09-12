import 'package:flutter/material.dart';
import 'package:persistences_types/commons/constants.dart';
import 'package:persistences_types/commons/list_item.dart';
import 'package:persistences_types/floor/screens/form_book.dart';

class ListBooksWidget extends StatefulWidget {
  const ListBooksWidget({super.key});

  @override
  State<ListBooksWidget> createState() => _ListBooksWidgetState();
}

class _ListBooksWidgetState extends State<ListBooksWidget> {
  List books = [{}];

  @override
  Widget build(BuildContext context) {
    const title = Text("Livros");
    final addRoute = BookFormWidget(); 

    return Scaffold(
      appBar: AppBar(
          title: title,
          actions: [IconButton(icon: addIcon, onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => addRoute));
          })]),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListItemWidget(title: "titulo", leading: "1", subtitle: "subtitle", onLongPress: _onDeleteBook);
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: books.length),
    );
  }

  _onDeleteBook(){

  }
}

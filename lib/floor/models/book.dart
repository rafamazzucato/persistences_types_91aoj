import 'package:floor/floor.dart';

@entity
class Book {
  @primaryKey
  int? id;
  String title;
  String author;

  Book(this.title, this.author);
}

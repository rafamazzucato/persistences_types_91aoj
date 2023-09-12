import 'dart:async';
import 'package:floor/floor.dart';
import 'package:persistences_types/floor/daos/book_dao.dart';
import 'package:persistences_types/floor/models/book.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'appDatabase.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase{
  BookDAO get bookDAO;
}
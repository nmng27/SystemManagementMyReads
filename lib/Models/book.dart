import 'package:management_books_system_web/Enums/category_enum.dart';

class Book {
  final int id;
  final int publisherId;
  final String name;
  final int pages;
  final Categorys category;
  bool isFavorite;
  final int authorId;

  Book({
    required this.id,
    required this.name,
    required this.category,
    required this.pages,
    required this.publisherId,
    this.isFavorite = false, 
    required this.authorId
  });
}

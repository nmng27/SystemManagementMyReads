import 'package:get/get.dart';
import 'package:management_books_system_web/Enums/category_enum.dart';
import 'package:management_books_system_web/Models/book.dart';

class BookController extends GetxController {
  // Listas reativas
  final books = <Book>[].obs;
  final booksFilter = <Book>[].obs;

  // Preencher a lista a partir de JSON
  void fromJson(List<Map<String, dynamic>> json) {
    json.forEach((e) {
      var newBook = Book(
        id: e["id"],
        name: e["name"],
        category: getCategory(e["category"])!,
        pages: e["pages"],
        publisherId: e["publisherId"],
        isFavorite: bool.parse(e["isFavorite"]),
      );
      books.add(newBook);
      booksFilter.add(newBook);
    });
    // refresh() não é necessário, obs já atualiza automaticamente
  }

  // Adicionar livro
  void add(Book book) {
    books.add(book);
    booksFilter.add(book);
  }

  // Atualizar livro
  void upd(Book book) {
    final index = books.indexWhere((e) => e.id == book.id);
    if (index != -1) books[index] = book;

    final indexFilter = booksFilter.indexWhere((e) => e.id == book.id);
    if (indexFilter != -1) booksFilter[indexFilter] = book;
  }

  // Deletar livro
  void delete(int id) {
    books.removeWhere((e) => e.id == id);
    booksFilter.removeWhere((e) => e.id == id);
  }

  // Filtrar livros
  void onFilter(String? name, Categorys? category) {
    final resultado = books.where((e) {
      final matchName = name == null || name.isEmpty || e.name.toLowerCase().contains(name.toLowerCase());
      final matchCategory = category == null  || e.category == category;
      return matchName && matchCategory;
    }).toList();

    booksFilter.assignAll(resultado);
  }

  // Limpar filtros
  void onClear() {
    booksFilter.assignAll(books);
  }

  void onFavorite(int id){
    booksFilter.forEach((e){
      if(e.id == id){
        e.isFavorite = !e.isFavorite;
      }
    });
  }
}

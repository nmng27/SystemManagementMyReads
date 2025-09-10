import 'package:get/get.dart';
import 'package:management_books_system_web/Models/author.dart';

class AuthorController extends GetxController{
  RxList<Author> authors = <Author>[].obs;
  RxList<Author> authorsWithFilter = <Author>[].obs;

  void fromJson(List<Map<String, dynamic>> json){
    json.forEach((e){
      var new_element = Author(id: e["id"], name: e["name"]);
      authors.add(new_element);
      authorsWithFilter.add(new_element);
    });
  }

  void add(Author author){
    authors.add(author);
    authorsWithFilter.add(author);
  }

  List<String> getAuthors(){
    var list = <String>[].obs;

    authors.forEach((e){
      list.add(e.name);
    });
    return list;
  }

  int? getAuthor(String name){
    Author search = authorsWithFilter.where((e)=>e.name.contains(name)).single;
    return search.id;
    
  }
}
import 'package:get/get.dart';
import 'package:management_books_system_web/Models/Read.dart';

class ReadController extends GetxController{
  RxList<Read> reads = <Read>[].obs;
  RxList<Read> readsWithFilter = <Read>[].obs;

  void fromJson(List<Map<String, dynamic>> json){
    json.map((e){
      var new_element = Read(
        id: e["id"], 
        bookId: e["bookId"], 
        userId: e["userId"], 
        dateStart: DateTime.parse(e["dateStart"]), 
        isFinished: bool.parse(e["isFinished"]), 
        isLiked: bool.parse(e["isLiked"]));
      reads.assign(new_element);
      readsWithFilter.add(new_element);
    });
  }

  void add(Read read){
    reads.add(read);
    readsWithFilter.add(read);
  }

  void edit(Read read){
    final index = reads.indexWhere((e)=>e.id == read.id);
    reads[index] = read;
    final indexFilter = reads.indexWhere((e)=>e.id == read.id);
    readsWithFilter[indexFilter] = read;
  }

  void delete(int id){
    reads.removeWhere((e)=>e.id == id);
    readsWithFilter.removeWhere((e)=>e.id == id);
  }

  void check(int id, bool value){
    reads.map((e){
      if(e.id == id){
        e.isFinished = value;
      }
    });
  }

  
  
}
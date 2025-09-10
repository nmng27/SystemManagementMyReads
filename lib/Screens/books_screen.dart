import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Controllers/author_controller.dart';
import 'package:management_books_system_web/Controllers/book_controller.dart';
import 'package:management_books_system_web/Controllers/read_controller.dart';
import 'package:management_books_system_web/Controllers/user_controller.dart';
import 'package:management_books_system_web/Enums/category_enum.dart';
import 'package:management_books_system_web/Models/Read.dart';
import 'package:management_books_system_web/Styles/color.dart';
import 'package:management_books_system_web/Validations/formatters.dart';
import 'package:management_books_system_web/Widgets/app_bar_default.dart';
import 'package:management_books_system_web/Widgets/card_list.dart';
import 'package:management_books_system_web/Widgets/input_text_field.dart';

class BooksScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BooksScreen();
}

class _BooksScreen extends State<BooksScreen>{
  final controller = Get.put(BookController());
  final nameController = TextEditingController();
  String? category;
  String? author;
  final _key = GlobalKey<FormState>();
  final auxController = Get.put(AuthorController());
  final readController = Get.put(ReadController());
  final userController = Get.put(UserController());

  void openForm(BuildContext context){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Pesquise por livros"),
          content: Form(
            key: _key,
            child: Column(
              children: [
                InputTextField(
                  label: "Nome", 
                  placeholder: "Digite o nome do livro que deseja buscar.", 
                  controller: nameController, 
                  validators: (val){
                    if(val!.isEmpty){
                      return "Por favor digite o nome do livro.";
                    }
                    return null;
                  }, formatter: [], 
                  keyBoard: TextInputType.text),
                SizedBox(height: 16,),
                DropdownTextField(
                  label: "Gênero", 
                  placeholder: "Selecione o gênero dos livros que deseja buscar.", 
                  items: getEnums(), 
                  onChanged: (val){
                    setState(() {
                      category = val;
                    });
                  }, 
                  validator: (val){
                    if(val!.isEmpty){
                      return "Por favor selecione um gênero.";
                    }
                    return null;
                  }, value: category!),
                SizedBox(height: 16,),
                DropdownTextField(
                  label: "Autor", 
                  placeholder: "Selecione o autor do livro que deseja filtrar.", 
                  items: auxController.getAuthors(), 
                  onChanged: (val){
                    setState(() {
                      author = val;
                    });
                  }, 
                  validator: (val){
                    if(val!.isEmpty){
                      return "Por favor selecione um autor.";
                    }
                    return null;
                  }, value: author!)
              ],
            ),

          ),
          actions: [
            Row(
              children: [
                ElevatedButton(
                onPressed: ()=>controller.onFilter(nameController.text, getCategory(category!), author), 
                child: Text("Filtrar")),
              TextButton(
                onPressed: (){
                  controller.onClear();
                  nameController.text = "";
                  category = null;
                  author = null;
                }, 
                child: Text("Limpar Filtro"))
              ],
            )
          ],
        );
      });
  }

  Widget createFormToExpand(BuildContext context){
    return Column(
      children: [
        InputTextField(
          label: "Nome", 
          placeholder: "Digite o nome do livro que deseja buscar.", 
          controller: nameController, 
          validators: (val){
            if(val!.isEmpty){
              return "Por favor digite o nome do livro que deseja filtrar.";
            }
            return null;
          }, 
          formatter: [TextFormatter()], 
          keyBoard: TextInputType.text),
        ElevatedButton(
          onPressed: ()=>openForm(context), 
          child: Text("Mais Filtros")),
      ],
    );
  }

  Widget listing(BuildContext context){
    return Expanded(
      child: ListView.builder(
        itemCount: controller.booksFilter.length,
        itemBuilder: (context, index){
          if(controller.booksFilter.length <= 0){
            return Column(
              children: [
                Icon(Icons.inbox, size: 250,color: getColor(),),
                SizedBox(height: 16,),
                Text("Nenhum livro na sua biblioteca.",
                style: TextStyle(
                  fontSize: 14,
                  color: getColor()
                ),)
              ],
            );
          }
          return CardList(
            title: controller.booksFilter[index].name, 
            subtitle: getCategoryInString(controller.booksFilter[index].category)!, 
            onPLayed: (){
              readController.add(
                Read(
                  id: readController.readsWithFilter[index].id+1, 
                  bookId: controller.booksFilter[index].id, 
                  userId: userController.user!.id, 
                  dateStart: DateTime.now())
              );
              Get.toNamed("/my_reads");
              Get.snackbar(
                "Leitura iniciada com sucesso!", 
                "Leitura iniciada com sucesso!",
                backgroundColor: Colors.teal,
                colorText: Colors.white);
            }, 
            icon: Icons.local_library, 
            onPresseds: [
              ()=>Get.toNamed("/edit_book", arguments: controller.booksFilter[index].id),
              (){
                controller.delete(controller.booksFilter[index].id);
                Get.snackbar("Livro excluído com sucesso!", "Livro excluído com sucesso!",
                backgroundColor: Colors.teal, colorText: Colors.white);
              }
            ], 
            onFavorite:()=> controller.onFavorite(controller.booksFilter[index].id));
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        leadingIcon: IconButton(
          onPressed: ()=>Get.toNamed("/my_library"), icon: Icon(Icons.arrow_back, color: Colors.white,)), 
          title: "Novo Livro"),
      body: Obx((){
        return Column(
          children: [
            createFormToExpand(context),
            listing(context)
          ],
        );
      }),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Styles/color.dart';

class AppBarDefault extends StatefulWidget implements PreferredSizeWidget {
  final Widget leadingIcon;
  final String title;

  const AppBarDefault({
    Key? key,
    required this.leadingIcon,
    required this.title,
  }) : super(key: key);

  @override
  State<AppBarDefault> createState() => _AppBarDefault();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarDefault extends State<AppBarDefault> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: getColor(),
      leading: widget.leadingIcon,
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed("/profile");
          },
          icon: Icon(Icons.person, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed("/settings");
          },
          icon: Icon(Icons.settings, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed("/login");
          },
          icon: Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }
}

class DrawerDefault extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: getColor(),
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.local_library,color: Colors.white,),
            title: Text(
              "Minha Biblioteca",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
            onTap: ()=>Get.toNamed("/my_library"),
          ),
          ListTile(
            leading: Icon(Icons.add, color: Colors.white),
            title: Text(
              "Adicionar Livro",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
            onTap: ()=>Get.toNamed("/add_book"),
          ),
          ListTile(
            leading: Icon(Icons.book, color: Colors.white,),
            title: Text(
              "Minhas Leituras",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),
            onTap: ()=>Get.toNamed("/my_reads"),
          )
        ],
      ),
    );
  }
}
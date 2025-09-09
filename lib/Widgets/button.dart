import 'package:flutter/material.dart';
import 'package:management_books_system_web/Styles/color.dart';

class Button extends StatefulWidget{
  final String title;
  final VoidCallback onPressed;
  const Button({
    Key? key, 
    required this.title,
    required this.onPressed
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _Button();
}

class _Button extends State<Button>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed, 
      child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(getColor()),
        foregroundColor: MaterialStateProperty.all(Colors.white)
      ),);
  }
}

class Link extends StatefulWidget{
  final String title;
  final VoidCallback onPressed;
  const Link({
    Key? key,
    required this.title,
    required this.onPressed
  }):super(key: key);

  @override
  State<StatefulWidget> createState() => _Link();
}

class _Link extends State<Link>{
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed, 
      child: Text(
        widget.title,
        style: TextStyle(color: getColor(),fontWeight: FontWeight.w500),
      ));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:management_books_system_web/Styles/color.dart';

class CardStats extends StatefulWidget{
  final dynamic stat;
  final String description;
  const CardStats(
    {
      Key? key, 
      required this.stat,
      required this.description
    }
  ):super(key: key);

  @override
  State<StatefulWidget> createState() => _CardStats();
}

class _CardStats extends State<CardStats>{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColor(),
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(widget.stat, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        subtitle: Text(widget.description, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:management_books_system_web/Styles/color.dart';

class CardListWithCheck extends StatelessWidget{
  final String title;
  final String subtitle;
  final VoidCallback onChecked;
  final IconData icon;
  final List<VoidCallback> onPresseds;
  const CardListWithCheck({
    Key? key, 
    required this.title,
    required this.subtitle,
    required this.onChecked,
    required this.icon,
    required this.onPresseds
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        margin: EdgeInsets.all(16),
        color: Colors.white54,
        elevation: 2.0,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          leading: Icon(icon, color: getColor()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: onChecked, icon: Icon(Icons.check_circle, color: getColor())),
              IconButton(onPressed: onPresseds[0], icon: Icon(Icons.edit, color: getColor())),
              IconButton(onPressed: onPresseds[1], icon: Icon(Icons.delete, color: getColor(),))
            ],
          ),
        ),
      ));
  }
}

class CardList extends StatelessWidget{
  final String title;
  final String subtitle;
  final VoidCallback onPLayed;
  final VoidCallback onFavorite;
  final IconData icon;
  final List<VoidCallback> onPresseds;
  const CardList({
    Key? key, 
    required this.title,
    required this.subtitle,
    required this.onPLayed,
    required this.icon,
    required this.onPresseds,
    required this.onFavorite,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        margin: EdgeInsets.all(16),
        color: Colors.white54,
        elevation: 2.0,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          leading: Icon(icon, color: getColor()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: onFavorite, icon: Icon(Icons.favorite, color: getColor(),)),
              IconButton(onPressed: onPLayed, icon: Icon(Icons.play_arrow, color: getColor(),)),
              IconButton(onPressed: onPresseds[0], icon: Icon(Icons.edit, color: getColor())),
              IconButton(onPressed: onPresseds[1], icon: Icon(Icons.delete, color: getColor(),))
            ],
          ),
        ),
      ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:management_books_system_web/Styles/color.dart';

class ButtonsFilter extends StatelessWidget{
  final List<VoidCallback> onPresseds;
  const ButtonsFilter(
    {
      Key? key, 
      required this.onPresseds
    }
  ):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPresseds[0], 
          child: Text("Filtrar", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(getColor())
          )),
          OutlinedButton(
            onPressed: onPresseds[1], 
            child: Text("Limpar Filtro", style: TextStyle(color: getColor())))
      ],
    );
  }
}
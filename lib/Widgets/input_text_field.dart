import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputTextField extends StatefulWidget{
  final String label;
  final String placeholder;
  final String? Function(String?)? validators;
  final TextEditingController controller;
  final List<TextInputFormatter> formatter;
  final TextInputType keyBoard;
  const InputTextField(
    {
      Key? key,
      required this.label,
      required this.placeholder,
      required this.controller,
      required this.validators,
      required this.formatter,
      required this.keyBoard
    }
  ):super(key: key);

  @override
  State<StatefulWidget> createState() => _InputTextField();
}

class _InputTextField extends State<InputTextField>{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        )
      ),
      controller: widget.controller,
      validator: widget.validators,
      inputFormatters: widget.formatter,
      keyboardType: widget.keyBoard,
    );
  }
}

class DropdownTextField extends StatefulWidget{
  final List<String> items;
  final String label;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final String Function(String?) validator;
  final String value;

  const DropdownTextField(
    {
      Key? key, 
      required this.label,
      required this.placeholder,
      required this.items,
      required this.onChanged,
      required this.validator,
      required this.value
    }
  ):super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownTextField();
}

class _DropdownTextField extends State<DropdownTextField>{
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        items: widget.items.map((e){
          return DropdownMenuItem<String>(
            child: Text(e));
        }).toList(), 
        onChanged: widget.validator,
        value: widget.value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.label,
          hintText: widget.placeholder,
          floatingLabelBehavior: FloatingLabelBehavior.always
        ),
        ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const PasswordTextField({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = true; // não precisa de RxBool aqui

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.label,
        hintText: widget.placeholder,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: Icon(obscure ? Icons.lock : Icons.lock_open),
        ),
      ),
    );
  }
}


class InputDatePicker extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?) validators;

  const InputDatePicker({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.validators,
  }) : super(key: key);

  @override
  State<InputDatePicker> createState() => _InputDatePickerState();
}

class _InputDatePickerState extends State<InputDatePicker> {
  Future<void> openDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final formatted = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {
        widget.controller.text = formatted; // Atualiza o campo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true, // evita abrir teclado
      controller: widget.controller,
      validator: widget.validators,
      onTap: () => openDate(context),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.controller.text.isEmpty
            ? widget.placeholder
            : widget.controller.text, // mostra data escolhida no hint
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
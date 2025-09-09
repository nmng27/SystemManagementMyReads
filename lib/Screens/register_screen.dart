import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Styles/color.dart';
import 'package:management_books_system_web/Validations/formatters.dart';
import 'package:management_books_system_web/Widgets/button.dart';
import 'package:management_books_system_web/Widgets/input_text_field.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: getColor(),
        title: Text("Cadastro",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
        leading: IconButton(onPressed: (){
          Get.toNamed("/login");
        }, icon: Icon(Icons.arrow_back,color: Colors.white)),
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        color: Colors.white,
        elevation: 3,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 16,),
              InputTextField(
                label: "Nome", 
                placeholder: "Digite o seu nome.", 
                controller: nameController, 
                validators: (val){
                  if(val!.isEmpty){
                    return "Por favor insira o seu nome.";
                  }
                  return null;
                }, 
                formatter: [TextFormatter()], 
                keyBoard: TextInputType.text),
              SizedBox(height: 16,),
              InputTextField(
                label: "Endereço de e-mail", 
                placeholder: "Digite o seu endereço de e-mail.", 
                controller: mailController, 
                validators: (val){
                  if(val!.isEmpty){
                    return "Por favor insira o seu endereço de e-mail.";
                  }
                  return null;
                }, 
                formatter: [TextFormatter()], 
                keyBoard: TextInputType.text),
              SizedBox(height: 16,),
              InputTextField(
                label: "Telefone", 
                placeholder: "Digite o seu telefone.", 
                controller: phoneController, 
                validators: (val){
                  if(val!.isEmpty){
                    return "Por favor insira o seu telefone.";
                  }
                  return null;
                }, 
                formatter: [PhoneFormatter()], 
                keyBoard: TextInputType.text),
              SizedBox(height: 16,),
              InputDatePicker(
                label: "Data de Nascimento", 
                placeholder: "Selecione a sua data de nascimento.", 
                controller: dateController, 
                validators: (val){
                  if(val!.isEmpty){
                    return "Por favor selecione a sua data de nascimento.";
                  }
                  return null;
                }),
              SizedBox(height: 16,),
              PasswordTextField(
                label: "Senha", 
                placeholder: "Digite a sua senha.", 
                controller: pwdController, 
                validator: (val){
                  if(val!.isEmpty){
                    return "Por favor digite a sua senha.";
                  }
                  return null;
                }),
              SizedBox(height: 16,),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: Button(title: "Entrar", onPressed: (){}),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

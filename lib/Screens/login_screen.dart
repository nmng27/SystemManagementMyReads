import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_books_system_web/Styles/color.dart';
import 'package:management_books_system_web/Validations/formatters.dart';
import 'package:management_books_system_web/Widgets/button.dart';
import 'package:management_books_system_web/Widgets/input_text_field.dart';

class LoginScreen extends StatelessWidget{
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("logo.png",width: 750,height: 250,),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: getColor(),
                  ),
                ),
                SizedBox(height: 16),
                InputTextField(
                  label: "Endereço de e-mail", 
                  placeholder: "Digite o seu endereço de e-mail.", 
                  controller: usernameController, 
                  validators: (val){
                    if(val!.isEmpty){
                      return "Por favor digite um endereço de e-mail.";
                    }
                    return null;
                  }, 
                  formatter: [EmailFormatter()], 
                  keyBoard: TextInputType.emailAddress),
                  SizedBox(height: 16,),
                PasswordTextField(
                  label: "Senha", 
                  placeholder: "Digite a sua senha", 
                  controller: passwordController, 
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
                SizedBox(height: 16,),
                Link(title: "Não possui conta? Cadastre-se", 
                  onPressed: (){
                    Get.toNamed("/register");
                  })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
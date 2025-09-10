import 'package:get/get.dart';

enum Categorys {
  ACADEMICO, AVENTURA, BIOGRAFIA, DESENVOLVIMENTO_PESSOAL, DISTOPIA, DRAMA,
  FANTASIA, FICCAO_CIENTIFICA, HISTORICO, MISTERIO,POLICIAL, SUSPENSE, TERROR,
}

Categorys? getCategory(String category){
  switch(category.toLowerCase()){
    case "acadêmico":
    return Categorys.ACADEMICO;
    case "aventura":
    return Categorys.AVENTURA;
    case "biografia":
    return Categorys.BIOGRAFIA;
    case "desenvolvimento pessoal":
    return Categorys.DESENVOLVIMENTO_PESSOAL;
    case "distopia":
    return Categorys.DISTOPIA;
    case "drama":
    return Categorys.DRAMA;
    case "Fantasia":
    return Categorys.FANTASIA;
    case "ficção científica":
    return Categorys.FICCAO_CIENTIFICA;
    case "histórico":
    return Categorys.HISTORICO;
    case "mistério":
    return Categorys.MISTERIO;
    case "policial":
    return Categorys.POLICIAL;
    case "suspense":
    return Categorys.SUSPENSE;
    case "terror":
    return Categorys.TERROR;
  }
  return null;
}

List<String> getEnums(){
  RxList<String> list = <String>[].obs;
  list.add("Acadêmico");
  list.add("Aventura");
  list.add("Biografia");
  list.add("Desenvolvimento Pessoal");
  list.add("Distopia");
  list.add("Drama");
  list.add("Fantasia");
  list.add("Ficcção Científica");
  list.add("Histórico");
  list.add("Mistério");
  list.add("Policial");
  list.add("Suspense");
  list.add("Terror");
  return list;
}

String? getCategoryInString(Categorys category){
  if(category == Categorys.ACADEMICO){
    return "Acadêmico";
  }else if(category == Categorys.AVENTURA){
    return "Aventura";
  }else if(category == Categorys.BIOGRAFIA){
    return "Biografia";
  }else if(category == Categorys.DESENVOLVIMENTO_PESSOAL){
    return "Desenvolvimento Pessoal";
  }else if(category == Categorys.DISTOPIA){
    return "Distopia";
  }else if(category == Categorys.DRAMA){
    return "Drama";
  }
  else if(category == Categorys.FANTASIA){
    return "Fantasia";
  }
  else if(category == Categorys.FICCAO_CIENTIFICA){
    return "Ficção Científica";
  }else if(category == Categorys.HISTORICO){
    return "Histórico";
  }
  else if(category == Categorys.MISTERIO){
    return "Mistério";
  }else if(category == Categorys.POLICIAL){
    return "Policial";
  }else if(category == Categorys.SUSPENSE){
    return "Suspense";
  }else if(category == Categorys.TERROR){
    return "Terror";
  }else{
    return null;
  }
}
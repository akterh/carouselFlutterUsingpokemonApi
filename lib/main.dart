import 'package:flutter/material.dart';
import 'package:test_project_for_apply/pokemon_carousel.dart';
import 'package:test_project_for_apply/repositories/pokemon_repository.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> nameList = [];

  final List<int> idList = [];

  final List<String> imageList = [];

  final List<String> heightList = [];

  final List<String> weightList = [];

  final List<String> typeList1 = [];
  final List<String> typeList2 = [];




  Future pokemonData()async{
    try{
      var pokemonApiRespnose =await PokemonRepository().getPokemonApi();

      for (var i=0; i< pokemonApiRespnose.results.length;i++){
        var pokemonResponse= await PokemonRepository().getPokemonData("${pokemonApiRespnose.results[i].url}");
        nameList.add(pokemonResponse.name);
        idList.add(pokemonResponse.id);
        imageList.add(pokemonResponse.sprites.frontShiny);
        heightList.add(pokemonResponse.height.toString());
        weightList.add(pokemonResponse.weight.toString());
        typeList1.add(pokemonResponse.types[0].type.name.toString());
        // typeList2.add(pokemonResponse.types[1].type.name.toString());


      }
      print(weightList);
      print(typeList2);


    }catch(e){
      print(e);

    }

    // print(weightList);
    // print(imageList);
    print(typeList2);
    print(typeList1.length);

  }
  Future  futurePokemonData;

 @override
  void initState(){

   super.initState();
  futurePokemonData= pokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Home(idList,imageList,nameList,heightList,weightList,typeList1,typeList2,futurePokemonData) //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

//create new class for "home" property of MaterialApp()


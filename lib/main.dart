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


      }
      print(imageList);

    }catch(e){
      print(e);

    }

    print(weightList);

  }

 @override
  void initState(){
   pokemonData();
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Home(idList,imageList,nameList,weightList,heightList) //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

//create new class for "home" property of MaterialApp()


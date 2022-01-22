import 'package:http/http.dart' as http;
import '../model/pokemon.dart';
import '../model/pokemon_api.dart';
class PokemonRepository{
 Future<PokemonApiResult> getPokemonApi() async{
   String url = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0";
  Uri uriUrl = Uri.parse(url);
   final responsse = await http.get(
     uriUrl,
    headers: {
      "Content-Type" : "application/json"
    }

   );
   // print(responsse);

   return pokemonApiResultFromJson(responsse.body);
 }

Future getPokemonData(String url)async{

   Uri pokemonUrl = Uri.parse(url);
   final responsse =await  http.get(
       pokemonUrl,
       headers: {
         "Content-Type" : "application/json"
       }

   );

   return pokemonFromJson(responsse.body);

 }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_project_for_apply/repositories/pokemon_repository.dart';
class Home extends StatelessWidget{
  final  imgList;
  final idList;
  final nameList;
  final weightList;
  final heightList;
  Home(this.idList,this.imgList,this.nameList,this.heightList,this.weightList);


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height*.5;
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Carousel FullScreen Example'),
        ),
        body:FutureBuilder(
          future: PokemonRepository().getPokemonApi(),
          builder: (context,snapshot){
            if (snapshot.hasError){
              print(snapshot.error);
              print("error");
              return Container();
            }  else if(snapshot.hasData){
              print(snapshot.data);
              var pokemonApiRespnose = snapshot.data;

              return CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: .3,
                    autoPlayAnimationDuration: const Duration(milliseconds: 100),
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio:2,
                    height: height,



                    // pageSnapping: true
                  ),
                  itemCount:  pokemonApiRespnose.results.length,

                  itemBuilder:(BuildContext context, int itemIndex, int pageViewIndex)=>
                  snapshot.connectionState!=ConnectionState.done?
                      CircularProgressIndicator(
                        color: Colors.red,
                      ):
                      Container(
                          child: Stack(

                              children:[
                                Positioned(child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)

                                  ),
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    child: Image.network("${imgList[itemIndex]}",),
                                  ),
                                )
                                ),
                                Positioned(
                                    child: Text("${idList[itemIndex]}"))

                              ]
                            // Text(pokemonApiRespnose.results[itemIndex].url),
                          ),
                      )

              );
            }else{
              return Text("error");
            }
          },
        )

    );
  }
}
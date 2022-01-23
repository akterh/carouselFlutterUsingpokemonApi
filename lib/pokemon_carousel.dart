import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_project_for_apply/repositories/pokemon_repository.dart';
class Home extends StatefulWidget{
  final  imgList;
  final idList;
  final nameList;
  final weightList;
  final heightList;
  final typeList1;
  final typeList2;
  final Future  pokemonData;
  Home(this.idList,this.imgList,this.nameList,this.heightList,this.weightList,this.typeList1,this.typeList2,this.pokemonData);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*.4;
    final width = MediaQuery.of(context).size.height*.5;



    return SafeArea(
      child: Scaffold(
          body:
          FutureBuilder(
            future: widget.pokemonData ,
            builder: (context,snapshot){
              if (snapshot.hasError){
                print(snapshot.error);
                print("error");
                return Container();
              }  else if(snapshot.connectionState==ConnectionState.done){

               print( snapshot.connectionState);

                return

                  Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          viewportFraction: .5,
                          autoPlayAnimationDuration: const Duration(milliseconds: 100),
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio:.5,
                          height: height,
                          onPageChanged:(i,reason){
                            var _currentIndex = i;
                            // var  _currentName = widget.nameList[i];


                            setState((){
                              currentIndex=_currentIndex ;
                              // currentName =_currentName;


                            });
                            // print(currentName);
                            print(currentIndex);
                            print(_currentIndex);
                            // print(widget.typeList1);
                            // print(widget.typeList2);
                          },



                          // pageSnapping: true
                        ),
                        itemCount:  widget.imgList.length,


                        itemBuilder:(BuildContext context, int itemIndex, int pageViewIndex)=>
                            Container(

                                child:


                                      Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)

                                        ),
                                        elevation: 3,
                                        shadowColor: Colors.grey,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.network("${widget.imgList[itemIndex]}",),
                                              SizedBox(height: 100,width: 500,),

                                               Text("#${widget.idList[itemIndex]}",style: TextStyle(fontSize: 30),),

                                            ],
                                          ),
                                        ),
                                      )


                                          //



                            )

                ),
                      SizedBox(height: 60,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.nameList[currentIndex],style: TextStyle(color: Colors.black,fontSize: 42,fontWeight: FontWeight.bold),)
                        ],
                      ) ,

                      SizedBox(height: 60,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 16,),
                            child: Text("Height:${widget.heightList[currentIndex]}",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16,),
                            child: Text("Weight:${widget.weightList[currentIndex]}",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                          ),

                        ],
                      ) ,
                      SizedBox(height: 60,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Type:${widget.typeList1[currentIndex]??""}",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
                        ],
                      )
                      // ${widget.typeList1[currentIndex]??""}
    // ${widget.typeList2[currentIndex]??

                    ],
                  );
              }else{
                return Center(child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }
            },



          )

      ),
    );
  }
}
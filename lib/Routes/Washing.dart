
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flutter_counter.dart';

class Washing extends StatefulWidget {
  @override
  _WashingState createState() => _WashingState();
}

class _WashingState extends State<Washing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[ Icon(Icons.arrow_back,color: Colors.grey[600],size: 25,),
                    Icon(Icons.menu,color: Colors.grey[600],size: 25,)]
                ),
                SizedBox(height: 20,),
                Text("Washing",style: TextStyle(fontSize:20,color: Colors.grey[600],fontWeight: FontWeight.w500)),
                SizedBox(height: 20,),
                buildSearchContainer(),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/shirt.png","shirt", "\$20"),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/tshirt.png","T shirt", "\$25"),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/trousers.png","pants", "\$30"),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/scarf.png","scarf", "\$10"),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/jacket.png","jacket", "\$45"),
                SizedBox(height: 20,),
                CounterWidget("assets/images/ClothesBlack/coat.png","coat", "\$50"),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1

            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0XFF0E2433)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Next",style: TextStyle(color: Colors.white70),),
                  Icon(Icons.arrow_forward,color: Colors.white70,)
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total",style: TextStyle(fontSize:18,color: Colors.grey[600],fontWeight: FontWeight.w400),),
                Text("\$68",style: TextStyle(fontSize:18,color: Colors.blue,fontWeight: FontWeight.w500),),
              ],
            )
          ],
        ),
      ),
    );
  }


  Container buildSearchContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: Colors.white70),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey[200],
                         blurRadius: 3,
                         offset: Offset(0,3),
                       )
                     ]),
              child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child:  TextField(style:TextStyle(fontSize: 14,color: Colors.grey[500],),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 14,color: Colors.grey[500],),
                              fillColor: Colors.grey[500],
                              icon:  Icon(Icons.search),
                            ),
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                          ),
                ),
            );
  }
}
class CounterWidget extends StatefulWidget {
  String image,nom,prix;
  int selected=3;

  CounterWidget(this.image, this.nom, this.prix);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {


  @override
  Widget build(BuildContext context) {
    return buildContainerClothes(widget.image,widget.nom,widget.prix);
  }

  Widget buildContainerClothes(String image,String nom,String prix) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white70),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 3,
                  offset: Offset(0,3),
                )
              ]),
          child: Image.asset(image,height: 50,width: 50,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nom,style: TextStyle(fontSize: 22,color: Colors.grey[700]),),
            Text(prix,style: TextStyle(fontSize: 18,color: Colors.blue),),
          ],
        ),
        Counter(
          minValue: 0,
          maxValue: 10,
          decimalPlaces: 0,
          initialValue: widget.selected,
          step: 1,
          color: Colors.white,
          textStyle: TextStyle(letterSpacing: 10),
          onChanged: (value0){
            setState(() {
              widget.selected=value0;
            });
          },
        ),
      ],
    );
  }

}


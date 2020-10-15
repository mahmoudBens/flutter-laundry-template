import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Washing.dart';

class MainBoard extends StatefulWidget {
  @override
  _MainBoard createState() => _MainBoard();
}


class _MainBoard extends State<MainBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome,",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey[600]),),
                      Text("John",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey[700]),)
                    ],
                  ),
                  Icon(Icons.menu)
                ],
              ),
              SizedBox(height:40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItemMenu("assets/images/washer.png", "Washing"),
                buildItemMenu("assets/images/deep.png", "Steam press"),
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItemMenu("assets/images/dry.png", "Dry cleaning"),
                buildItemMenu("assets/images/formal.png", "Formal Wash"),
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItemMenu("assets/images/deep.png", "Deep cleaning "),
                buildItemMenu("assets/images/powder.png", "Powder Wash"),
              ],),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Current orders (3)",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.grey[700]),),
                  Text("View all",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(0,1)
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0,1),
                            blurRadius: 1
                          )
                        ]
                      ),
                      child: ClipRRect(
                        child: Image.asset("assets/images/delivery-truck.png",height: 40,),
                        borderRadius: BorderRadius.circular(20),
                        
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order No : #1234567890",style: TextStyle(fontWeight: FontWeight.w500),),
                        Text("Out of delivery",style: TextStyle(color: Colors.blue),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemMenu(String image,String text) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Washing()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
                  child: Column(
                    children: [
                      ClipRect(child: Image.asset(image,width: 100,height: 80,fit: BoxFit.fill,)),
                      SizedBox(height: 15,),
                      Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
                    ],
                  ),
                ),
    );
  }
}

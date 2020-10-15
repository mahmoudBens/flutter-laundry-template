import 'package:flutter_laundry_app/Model/SliderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laundry_app/Routes/Home.dart';

import '../main.dart';
import 'Login.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  List<SliderModel> Sliders = new List<SliderModel>();
  int currentState=0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Sliders=SliderModel.getSlides();
  }
  Widget pageIndexIndicator(bool isCurrentWidget)
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isCurrentWidget? 10 : 6,
      width: isCurrentWidget? 10 : 6,
      decoration: BoxDecoration(
        color: isCurrentWidget ? Colors.grey: Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: Sliders.length,
          onPageChanged: (val){
          setState(() {
            currentState=val;
          });
          },
          itemBuilder: (context,index) {
            return SlideTiles(
                Sliders[index].imagePath,
                Sliders[index].title,
                Sliders[index].text
            );
          },
        controller: pageController,
      ),
      bottomSheet: currentState!= Sliders.length-1?Container(
height: 60,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(child: Text("SKIP"),onTap: (){
              pageController.animateToPage(Sliders.length-1, duration: Duration(milliseconds: 400), curve: Curves.linear);

            },),
            Row(
              children: [
                for(int i=0;i<Sliders.length;i++)
                  i == currentState ? pageIndexIndicator(true ): pageIndexIndicator(false)
              ],
            ),
            GestureDetector(child: Text("NEXT"),onTap: (){
              pageController.animateToPage(currentState+1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },),
          ],
        ),
      ) :GestureDetector(
        child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        child: Text("Done",style: TextStyle(color: Colors.grey[700]),),
      ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    },
          ),
    );
  }
}
class SlideTiles extends StatelessWidget {
  String imagePath;
  String title;
  String text;

  SlideTiles(this.imagePath, this.title, this.text);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,height: 200,width: 250,),
          SizedBox(height: 15,),
          Text(title,style: TextStyle(fontSize: 20,color: Colors.black54,),textAlign: TextAlign.center,),
          SizedBox(height: 15,),
          Text(text,style: TextStyle(fontSize: 18,color: Colors.black38),textAlign: TextAlign.center,),

        ],
      ),
    );
  }

}

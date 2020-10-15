import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
FocusNode EmailNode=FocusNode(),PasswordNode=FocusNode();
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/1.jpg"),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",style: TextStyle(fontSize: 30,color: Color(0XFF0E2433)),),
                    SizedBox(height: 30,),
                    EmailText(),
                    SizedBox(height: 20,),
                    PasswordText(),
                    SizedBox(height: 15,),
                    Align(
                      alignment: Alignment.centerRight,
                        child: Text("Forgot Password ?",style: TextStyle(color: Color(0XFF0E2433),fontSize: 12,fontWeight: FontWeight.w500),textAlign: TextAlign.end,)),
                   SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainBoard()),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0XFF0E2433),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0,2),
                                blurRadius: 2
                              )
                            ]
                          ),
                          child:  Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                          ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ? ",style: TextStyle(color: Colors.grey,)),
                          Text("Sign Up",style: TextStyle(color: Color(0XFF0E2433),fontWeight: FontWeight.w500)),
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Container EmailText() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 3,
              offset: Offset(0,4),
            )
          ]),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child:  TextField(style:TextStyle(fontSize: 16,color:Color(0XFF0E2433),fontWeight: FontWeight.w400),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: !EmailNode.hasFocus?"userid@gmail.com":null,
            labelText: EmailNode.hasFocus?"Email":null,
            labelStyle: TextStyle(color: Colors.grey[600],fontSize: 18,fontWeight: FontWeight.w400),
            hintStyle: TextStyle(fontSize: 15,color: Color(0XFF0E2433),fontWeight: FontWeight.w400),
            fillColor: Colors.grey[500],
            border: EmailNode.hasFocus?InputBorder.none:UnderlineInputBorder(),
            prefixIcon:  Icon(Icons.mail_outline,color: Color(0XFF0E2433),),
          ),
          focusNode: EmailNode,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onSubmitted: (value){
            FocusScope.of(context).requestFocus(PasswordNode);

          },
        ),
      ),
    );
  }
  Container PasswordText() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white70),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 3,
              offset: Offset(0,3),
            )
          ]),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child:  TextField(style:TextStyle(fontSize: 14,color: Colors.grey[500],letterSpacing: 2),
          textAlignVertical: TextAlignVertical.center,
          obscureText: true,
          decoration: InputDecoration(
            border: PasswordNode.hasFocus?InputBorder.none:UnderlineInputBorder(),
            hintText: !PasswordNode.hasFocus?"*********":null,
            labelText: PasswordNode.hasFocus?"Password":null,
            labelStyle: TextStyle(fontSize: 17,color: Color(0XFF0E2433),),
            hintStyle: TextStyle(fontSize: 17,color: Color(0XFF0E2433),letterSpacing: 3),
            fillColor: Colors.grey[500],
            prefixIcon:  Icon(Icons.lock_outline,color: Color(0XFF0E2433),),
          ),
          focusNode: PasswordNode,
          maxLines: 1,
          textInputAction: TextInputAction.go,
          onSubmitted: (valeur){
          PasswordNode.unfocus();
          },
        ),
      ),
    );
  }
}

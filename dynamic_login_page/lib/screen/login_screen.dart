import 'dart:ui';

import 'package:dynamic_login_page/data/bg_data.dart';
import 'package:dynamic_login_page/utils/animation.dart';
import 'package:dynamic_login_page/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex=0;
  bool showOption=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(vertical:10,),
        height: 49,
        width: double.infinity,

        child: Row(
          children: [
            Expanded(
              child:showOption?ShowupAnimation(
                delay: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bgList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap:(){
                        setState((){
                          selectedIndex=index;
                        });
                      },
                      child: CircleAvatar(
                        radius: 30,

                        backgroundColor: selectedIndex==index?Colors.white:Colors.transparent,
                        child: Padding(
                          padding:const EdgeInsets.all(1),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(bgList[index],),
                            ), 
                        ),
                      ),
                    );
                  }),
                ):const SizedBox()),
                const SizedBox(width:20,),
                showOption?GestureDetector(
                  onTap: (){
                    setState((){
                      showOption=false;                    
                      });
                  },
                  child: const Icon(Icons.close,color:Colors.white,size:30),):
                  GestureDetector(
                    onTap:(){
                      setState((){
                        showOption=true;
                      });
                    },
                    child: CircleAvatar(

                      backgroundColor: Colors.white,
                      child: Padding(
                        padding:const EdgeInsets.all(1),
                        child: CircleAvatar(
                          radius:30,
                          backgroundImage: AssetImage(bgList[selectedIndex],),
                        ), 
                      ),
                    ),
                  )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width:double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgList[selectedIndex]),fit:BoxFit.fill
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal:30),
          decoration: BoxDecoration(
            border: Border.all(color:Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(

            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(filter:ImageFilter.blur(sigmaY:5,sigmaX:5),
            child: Padding(
              padding:const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Center(child: TextUtils(text:"Login",weight:true,size:30,),),
                  const Spacer(),
                  TextUtils(text: "Email",),
                  Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      border:Border(bottom: BorderSide(color:Colors.white))
                    ),
                    child: TextFormField(
                      style: const TextStyle(color:Colors.white),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.mail,color: Colors.white,),
                        fillColor: Colors.white,
                        border: InputBorder.none,),
                      ),
                    ),
                    const Spacer(),
                    TextUtils(text: "Password",),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color:Colors.white))
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.lock,color:Colors.white),
                          fillColor: Colors.white,
                          border:InputBorder.none,),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width:15,
                            color: Colors.white,
                          ),
                          const SizedBox(width:10,),
                          Expanded(child: TextUtils(text: "Remember Me, FORGET PASSWORD ",size: 12,weight :true,),),
                      ],
                      ),const Spacer(),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        alignment: Alignment.center,
                        child: TextUtils(text: "Login",color:Colors.black,),
                      ),
                      const Spacer(),
                      Center(child: TextUtils(text: "Don't have account REGISTER NOW",size: 12,weight: true,)),
                      const Spacer(),
                ],
              ), 
            ),
            ),
            
          ),
        ),
      ),
    );
  }
}
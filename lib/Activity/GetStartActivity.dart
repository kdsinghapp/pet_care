import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Tool/MyConstantString.dart';
class GetStartActivity extends StatefulWidget {
  const GetStartActivity({super.key, required this.title});
  final String title;

  @override
  State<GetStartActivity> createState() => _GetStartState();
}
class _GetStartState extends State<GetStartActivity> {

  @override
  Widget build(BuildContext context) {
    final heights =MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: heights*0.6,
                  child: Image.asset('assets/icons/getstartImg.png',fit: BoxFit.fitWidth,)),
              Container(
                height: heights*0.4,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text("Pet Service",style: MyTextStyle.titleStyle20bb,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 50),
                      child: Text(getStartText,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.only(left: 20,right: 20,),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: ElevatedButton(
                        onPressed: (){
                        Navigator.pushReplacementNamed(context, '/logInActivity');

                        },
                        style: TextButton.styleFrom(backgroundColor: primaryColor),
                        child: Text("Get Start",style: MyTextStyle.titleStyle16bw,),
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
    );
  }
}
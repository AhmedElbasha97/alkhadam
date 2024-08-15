
import 'package:alkhadam/web_view.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: <Widget>[
                Image.asset("assets/logo.jpg",scale:1,),
          const SizedBox(height: 40,),
                const Center(
                  child: Text("تطبيق الخدم \n يوفر عناء البحث عن خادمة",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize:
                  18,fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40,),
          Column(
            children: <Widget>[
              Container(width: MediaQuery.of(context).size.width,),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  const WebViewContainer("https://www.alkhadam.net/qa/ar/mobile/home"),
                )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white),
                      color:const Color(0xFF7e2670),
                  ),
                  child: const Text("عربي",style: TextStyle(color: Colors.white,fontSize:
                  18,fontWeight: FontWeight.bold),),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  const WebViewContainer("https://www.alkhadam.net/qa/en/mobile/home"),
              )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:const Color(0xFF7e2670),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),

                      border: Border.all(color: Colors.white),

                  ),
                  child: const Text("English",style: TextStyle(color: Colors.white,fontSize:
                  18,fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )
        ],
      ),
    )]));
  }
}

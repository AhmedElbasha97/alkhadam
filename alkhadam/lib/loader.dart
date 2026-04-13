import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';



class Loader extends StatelessWidget {
  const Loader({super.key, this.height=0, this.width=0});
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height==0?MediaQuery.of(context).size.height:height ,
      width: width==0?MediaQuery.of(context).size.width:width ,
      color:const Color(0x80000000),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.3,
          width:MediaQuery.of(context).size.width*0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white,Color(0xFF7e2670)],
              ),
            border: Border.all(width: 1, color: Colors.white),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, //soften the shadow
                spreadRadius: 0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  3.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,height: 150,
                  child: Image.asset("assets/logo with out background.png",fit: BoxFit.fitWidth,),
                ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms, color:  const Color(0xFF7e2670))
                .animate() // this wraps the previous Animate in another Animate
                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                .slide(),
                 const SizedBox(height:10),
                  Text(
                   "loading".tr(),
                  style:  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,

                    height: 1,
                    letterSpacing: -1,
                  ),
                ) .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color: const Color(0xFF7e2670))
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                    .slide(),
                const SizedBox(height: 10,),

              ],
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat())

            .animate() // this wraps the previous Animate in another Animate
            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
            .slide(),
      ),
    ) ;
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CompaniesMoreDataLoader extends StatelessWidget {
  const CompaniesMoreDataLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF8E2393), width: 2),
      ),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.25,
          width:MediaQuery.of(context).size.width,
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
            child: Row(

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
    );
  }
}

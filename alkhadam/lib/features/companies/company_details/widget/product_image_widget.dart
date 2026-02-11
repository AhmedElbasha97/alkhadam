// ignore_for_file: deprecated_member_use

import 'package:alkhadam/features/companies/company_details/widget/photo_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/utils/responsive.dart';


class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key, required this.imageUrl, required this.activeIndex, required this.imageTotalCount, this.imagesLink});
  final String? imageUrl;
  final int activeIndex;
  final String imageTotalCount;
  final List<String>? imagesLink;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  PhotoDetailedScreen(link: imagesLink,index: activeIndex,),settings: const RouteSettings(name: "CompanyDetailsScreen"),));
      },
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl:  imageUrl??"",
        imageBuilder: ((context, image){
          return  Stack(
            children: [
              Hero(
                tag:"imageHero$activeIndex",
                child: Container(
                    width:screenWidth(context),
                    height:screenHeight(context)*0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit:  BoxFit.fill,
                      ),
                    )
                ),
              ),
              Positioned(
                left:10,
                top:10,
                child: Container(
                    width:screenWidth(context)*0.15,
                    height:screenHeight(context)*0.03,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                    color: const Color(0xFF6A1B9A).withOpacity(0.65),
                  ),
                  child:Center(
                    child:Text(
                      "${activeIndex+1}/$imageTotalCount",
                      style:  const TextStyle(
                        height: 1.3,
                        fontSize: 12,
                        letterSpacing: 0,

                        color: Colors.white,
                      ),
                    ),

                  )
                    ),
              )

            ],
          );
        }),
        placeholder: (context, image){
          return   Container(

            width:screenWidth(context),
            height:screenHeight(context)*0.4,
            decoration:BoxDecoration(
              color:  const Color(0xFFF2F0F3),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 13.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child:Center(
              child: Container(

                width:screenWidth(context)*0.95,
                height:screenHeight(context)*0.38,
                decoration:BoxDecoration(
                  color:  const Color(0xFFDFDDDF),
                  borderRadius: BorderRadius.circular(15),

                ),
              ).animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color:   const Color(0xFF6A1B9A).withAlpha(10))
                  .animate() // this wraps the previous Animate in another Animate
              ,
            ),
          ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color:   const Color(0xFF6A1B9A).withAlpha(10))
              .animate() // this wraps the previous Animate in another Animate
              ;
        },
        errorWidget: (context, url, error){
          return SizedBox(
            width:screenWidth(context),
            height:screenHeight(context)*0.4,
            child: Image.asset("assets/logo with out background.png",fit: BoxFit.fitHeight,),
          );
        },
      ),
    );
  }
}

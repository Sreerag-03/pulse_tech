import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pulse_tech/components/bottomsheet.dart';
import 'package:pulse_tech/components/components.dart';
import 'package:pulse_tech/utils/colors.dart';
import 'package:pulse_tech/utils/text.dart';

class Newsbox extends StatelessWidget {
  final String imageurl, title, description, time, url;
  const Newsbox({super.key, required this.imageurl, required this.title, required this.description, required this.time, required this.url});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: (){
            showMyBottomSheet(context, url, description,imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 5,left: 5,right: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(imageUrl: imageurl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                placeholder: (context,url) => CircularProgressIndicator(color: AppColors.primary),
                errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8,),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    modifiedText(text: title, size: 16, color: AppColors.white),
                    SizedBox(height: 5,),    
                    modifiedText(text: time, size: 12, color: AppColors.lightwhite)
                  ],
                ))
              ],
            ),
          ),
        ),
        DividerWidget(),
      ],
    );
  }
}
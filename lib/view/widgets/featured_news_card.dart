// import 'dart:ffi';

// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/news_detail_page.dart';
import 'package:readky/view/utils/app_theme.dart';
import 'package:readky/view/widgets/tag_card.dart';
import 'package:mongol/mongol.dart';
import 'dart:convert';  // To decode JSON

class FeaturedNewsCard extends StatelessWidget {
  final News data;
  FeaturedNewsCard({required this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(SlidePageRoute(child: NewsDetailPage(data: data)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height/1.3,
        width: MediaQuery.of(context).size.width/5,
        // width: MediaQuery.of(context).size.width/5,
        // decoration: data.photo != null ? BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   image: DecorationImage(
        //     image: AssetImage(data.photo!),
        //     fit: BoxFit.cover,
        //   ),
        // ) :BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/0.5,
              width:  MediaQuery.of(context).size.width/5,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // decoration: BoxDecoration(gradient: AppTheme.textOverlayGradient),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/0.5,
                    width: data.photo.isNotEmpty ? MediaQuery.of(context).size.width/25 : MediaQuery.of(context).size.width/10,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                    child: MongolText(                  
                      data.title.isNotEmpty ? data.title : data.description,
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 26,
                        height: 150 / 100,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'TraditionalMongolian',
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/0.5,
                    // ignore: unnecessary_null_comparison
                    width: data.photo.isNotEmpty ? MediaQuery.of(context).size.width/60 : MediaQuery.of(context).size.width/1000,
                    color: Colors.white,
                    alignment: AlignmentDirectional.bottomEnd,
                    margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                    child: MongolText(
                      data.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        height: 150 / 100,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                        fontFamily: 'TraditionalMongolian',
                      ),
                    ),
                  ),

                  // Container(
                  //  height: MediaQuery.of(context).size.height/0.5,
                  //  // ignore: unnecessary_null_comparison
                  //  width: data.photo != null ? MediaQuery.of(context).size.width/9 : MediaQuery.of(context).size.width/100,
                  //  child: Image.network(
                  //    data.photo.first,
                  //    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  //    fit: BoxFit.cover),
                  // ),

                  Container(
                    height: MediaQuery.of(context).size.height/0.5,
                    width: data.photo.isNotEmpty ? MediaQuery.of(context).size.width/9 : MediaQuery.of(context).size.width/100,
                    // child: data.photo != null ? Image.network(
                    //   data.photo.first,
                    //   errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                    //   fit: BoxFit.cover)
                    // ) : SizedBox(height: 20),
                    // child: SizedBox(height: 20),
                    child: data.photo.isNotEmpty ? Image.network(data.photo.first, fit: BoxFit.cover) : SizedBox(height: 20),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

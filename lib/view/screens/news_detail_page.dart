import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';
import 'package:mongol/mongol.dart';

class NewsDetailPage extends StatelessWidget {
  final News data;
  NewsDetailPage({required this.data});
  ScrollController innerController = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    int generate_photo_number =  this.data.photo != null ? data.photo.length : 0;
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        onPressedLeading: () {},
        // title: SvgPicture.asset('assets/icons/appname.svg'),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.share_outlined,
        //       color: Colors.white.withOpacity(0.5),
        //     ),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset(
        //       'assets/icons/Bookmark.svg',
        //       color: Colors.white.withOpacity(0.5),
        //     ),
        //   ),
        // ], profilePicture: SvgPicture.asset('assets/icons/appname.svg'), onPressedProfilePicture: (){},
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: BouncingScrollPhysics(),
        children: [
          // section 3 - Based on Your Reading History
          Container(
            height: MediaQuery.of(context).size.height/1.3,
            child: Listener(
              onPointerSignal: (event) {
                      if (event is PointerScrollEvent) {
                        final offset = event.scrollDelta.dy;
                        innerController.jumpTo(innerController.offset + offset);
                      }
              },
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: innerController,
                  child: Container(
                    // height: 900,
                    margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                    child: Row(
                       children:  data.title != null ?  [
                         SizedBox(width: 20),
                         Column(
                          children: [
                            Container(
                             height: 100,
                             width:  100,
                             decoration: data.photo != null ? BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               image: DecorationImage(
                                 image: AssetImage(data.photo!.first),
                                 fit: BoxFit.cover,
                               ),
                             ) :BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                             ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                 alignment: AlignmentDirectional.topStart,
                                 child: MongolText(
                                   data.author!,
                                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, height: 150 / 100, color: Colors.blue, fontFamily: 'TraditionalMongolian'),
                                 ),
                                ),
                                Container(
                                  child: MongolText(
                                    data.date,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 24,
                                      height: 150 / 100,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                      fontFamily: 'TraditionalMongolian',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                         ),
                         SizedBox(width: 20),
                         Container(
                           margin: EdgeInsets.only(top: 80, bottom: 100, left: 0, right: 0),
                           child: MongolText(
                             data.title!,
                             style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, height: 150 / 100, fontFamily: 'TraditionalMongolian'),
                           ),
                         ),
                         SizedBox(width: 20),
                         Container(
                          margin: EdgeInsets.only(top: 30, bottom: 0, left: 0, right: 0),
                           child: MongolText(
                             data.description!,
                             style: TextStyle(fontSize: 28, height: 150 / 100, fontWeight: FontWeight.w500, fontFamily: 'TraditionalMongolian'),
                           ),
                         ),
                         Container(
                           width: 500,
                           child: GridView.count(
                             // Create a grid with 2 columns. If you change the scrollDirection to
                             // horizontal, this produces 2 rows.

                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             crossAxisCount: 2,
                             // Generate 100 widgets that display their index in the List.
                             children: List.generate(generate_photo_number, (index) {
                                return Image.network(
                                     data.photo[index],
                                    //  https://www.dropbox.com/scl/fi/6z4k3dug1cguc5f17d89r/spacejam.jpg?rlkey=kg9wscrtimel3f2cjbvna3lz2&st=mzlfjs1o&dl=0,
                                     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                       if (loadingProgress == null) {
                                         return child;
                                       } else {
                                         return Center(
                                           child: CircularProgressIndicator(
                                             value: loadingProgress.expectedTotalBytes != null
                                                 ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                 : null,
                                           ),
                                         );
                                       }
                                     },
                                     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                       return Text('Failed to load image');
                                     },
                                   );
                              //  return Center(
                              //   child: Container(
                              //    padding: const EdgeInsets.all(1.0),
                              //    margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                              //    decoration: BoxDecoration(
                              //    color: Colors.white,
                              //    image: DecorationImage(
                              //               image: AssetImage(data.photo!), fit: BoxFit.cover)),
                              //   )
                              //  );
                             }),
                           ),
                         ),
                       ] : [
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Container(
                             height: 100,
                             width:  100,
                             decoration: data.photo != null ? BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                               image: DecorationImage(
                                 image: AssetImage(data.photo!.first),
                                 fit: BoxFit.cover,
                               ),
                             ) :BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                             ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                 alignment: AlignmentDirectional.topStart,
                                 child: MongolText(
                                   data.author!,
                                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, height: 150 / 100, color: Colors.blue, fontFamily: 'TraditionalMongolian'),
                                 ),
                                ),
                                Container(
                                  child: MongolText(
                                    data.date,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 24,
                                      height: 150 / 100,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                      fontFamily: 'TraditionalMongolian',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                         ),
                         SizedBox(width: 20),
                         Container(
                           margin: EdgeInsets.only(top: 30, bottom: 0, left: 0, right: 0),
                           child: MongolText(
                             data.description!,
                             style: TextStyle(fontSize: 28, height: 150 / 100, fontWeight: FontWeight.w500, fontFamily: 'TraditionalMongolian'),
                           ),
                         ),
                         Container(
                           width: 500,
                           child: GridView.count(
                             // Create a grid with 2 columns. If you change the scrollDirection to
                             // horizontal, this produces 2 rows.

                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             crossAxisCount: 2,
                             // Generate 100 widgets that display their index in the List.
                             children: List.generate(generate_photo_number, (index) {
                                   return Image.network(
                                     data.photo!.first,
                                    //  https://www.dropbox.com/scl/fi/6z4k3dug1cguc5f17d89r/spacejam.jpg?rlkey=kg9wscrtimel3f2cjbvna3lz2&st=mzlfjs1o&dl=0,
                                     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                       if (loadingProgress == null) {
                                         return child;
                                       } else {
                                         return Center(
                                           child: CircularProgressIndicator(
                                             value: loadingProgress.expectedTotalBytes != null
                                                 ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                 : null,
                                           ),
                                         );
                                       }
                                     },
                                     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                       return Text('Failed to load image');
                                     },
                                   );
                              //  return Center(
                              //   child: Container(
                              //    padding: const EdgeInsets.all(1.0),
                              //    margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                              //    decoration: BoxDecoration(
                              //    color: Colors.white,
                              //    image: DecorationImage(
                              //               image: AssetImage(data.photo!), fit: BoxFit.cover)),
                              //   )
                              //  );
                             }),
                           ),
                         ),
                       ],
                    ),
                  ),
              ),
            ),
          ),
        ],
      ),
      // body: ListView(
      //   shrinkWrap: true,
      //   physics: BouncingScrollPhysics(),
      //   children: [
      //     Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: 240,
      //       decoration: BoxDecoration(
      //         color: Colors.grey,
      //         image: DecorationImage(
      //           image: AssetImage(data.photo!),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: MediaQuery.of(context).size.height,
      //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      //       child: Row(
      //         // mainAxisAlignment: MainAxisAlignment.start,
      //         // crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           MongolText(
      //             '${data.date} | ${data.author}.',
      //             style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(top: 12, bottom: 20),
      //             child: MongolText(
      //               data.title!,
      //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 150 / 100, fontFamily: 'TraditionalMongolian'),
      //             ),
      //           ),
      //           MongolText(
      //             data.description!,
      //             style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14, height: 150 / 100, fontWeight: FontWeight.w500),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

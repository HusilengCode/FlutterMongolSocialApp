import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/model/core/news.dart';
import 'package:readky/model/helper/news_helper.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/breaking_news_page.dart';
import 'package:readky/view/screens/profile_page.dart';
import 'package:readky/view/widgets/breaking_news_card.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';
import 'package:readky/view/widgets/featured_news_card.dart';
import 'package:readky/view/widgets/news_tile.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController innerController = ScrollController();
  // List<News> featuredNewsData = NewsHelper.featuredNews;
  // List<News> breakingNewsData = NewsHelper.breakingNews;
  // List<News> recomendationNewsData = NewsHelper.recomendationNews;

  List<News> featuredNewsData = [];

  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/featuredNews'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      setState(() {
      featuredNewsData = json.map((item) => News.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load News');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        // leadingIcon: Icon(CupertinoIcons.menu, color: Colors.blue, size: 30,),
        leadingIcon: SvgPicture.asset(
          'assets/icons/Menu.svg',
          color: Colors.yellow,
          width: 30,
        ),
        onPressedLeading: () {
          Scaffold.of(context).openDrawer();
          _fetchNews();
        },
        profilePicture: Icon(CupertinoIcons.pencil, color: Colors.yellow, size: 30,),
        onPressedProfilePicture: () {
          Navigator.of(context).push(SlidePageRoute(child: ProfilePage()));
        },
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // section 3 - Based on Your Reading History
          Container(
            child: Listener(
              onPointerSignal: (event) {
                      if (event is PointerScrollEvent) {
                        final offset = event.scrollDelta.dy;
                        innerController.jumpTo(innerController.offset + offset);
                        _fetchNews();
                      }
              },
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: innerController,
                  child: Row(
                      // children: ListView.separated(
                      //   padding: EdgeInsets.symmetric(horizontal: 16),
                      //   scrollDirection: Axis.vertical,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemCount: allCategoriesNews.length,
                      //   separatorBuilder: (context, index) {
                      //     return SizedBox(height: 16);
                      //   },
                      //   itemBuilder: (context, index) {
                      //     return NewsTile(data: allCategoriesNews[index]);
                      //   },
                      // ),

                        // children: ListView.separated(
                        //   padding: EdgeInsets.symmetric(horizontal: 16),
                        //   scrollDirection: Axis.vertical,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   itemCount: featuredNewsData.length,
                        //   separatorBuilder: (context, index) {
                        //     return SizedBox(height: 16);
                        //   },
                        //   itemBuilder: (context, index) {
                        //     return FeaturedNewsCard(data: featuredNewsData[index]);
                        //   },
                        // ),

                      children: new List.generate(featuredNewsData.length, (int index) {
                       return new Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(3.0),
                          child: new FeaturedNewsCard(
                                // data: featuredNewsData[2 * index],
                                data: featuredNewsData[index],
                              )
                          // child: new Column(
                          //   children: [
                          //     new FeaturedNewsCard(
                          //       // data: featuredNewsData[2 * index],
                          //       data: featuredNewsData[index],
                          //     ),
                          //     SizedBox(height: 10),
                          //     new FeaturedNewsCard(
                          //       // data: featuredNewsData[2 * index + 1],
                          //       data: featuredNewsData[2 * index + 1],
                          //     ),
                          //   ],
                          // )


                          // child: new FeaturedNewsCard(
                          //   data: featuredNewsData[index],
                          // ),


                       );
                      }),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

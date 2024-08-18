import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/auth/login_page.dart';
import 'package:readky/view/screens/auth/register_page.dart';
import 'package:readky/view/widgets/switchable_button.dart';
import 'package:mongol/mongol.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/webhome.jpg',
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                left: MediaQuery.of(context).size.width / 2 - 85,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Row(
                    children: [
                     
                        MongolElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPage()));
                          },
                          child: MongolText(
                            'ᠳᠠᠩᠰᠠᠯᠠᠬᠤ', 
                            style: TextStyle(fontFamily: 'TraditionalMongolian', color: Color.fromARGB(255, 9, 5, 10)),
                            textScaleFactor: 4,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 189, 171, 12)),
                            // backgroundColor: Colors.white, // This is what you need!
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)
                              )
                            ),
                          )
                        ),
                      
                      SizedBox(width: 30),
                      MongolElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                          },
                          child: MongolText(
                            'ᠨᠡᠪᠲᠡᠷᠡᠬᠦ ', 
                            style: TextStyle(fontFamily: 'TraditionalMongolian', color: Colors.purple),
                            textScaleFactor: 4,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            // backgroundColor: Colors.white, // This is what you need!
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black)
                              )
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/page_switch.dart';
import 'package:readky/view/widgets/custom_text_field.dart';
import 'package:mongol/mongol.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ), systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            // Section 2 - Form
            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/3),
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: CustomTextField(
                      hintText: 'youremail@email.com',
                      labelText: 'Email', 
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: CustomTextField(
                      labelText: 'Password',
                      hintText: '********',
                      obsecureText: true,
                    ),
                  ),
                ],
              ),
            ),
            // Section 3 - Register Button
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/15),
                      child: MongolElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(SlidePageRoute(child: PageSwitch()));
                        },
                        child: MongolText(
                          'ᠨᠡᠪᠲᠡᠷᠡᠬᠦ ', 
                          style: TextStyle(fontFamily: 'TraditionalMongolian', color: Colors.purple),
                          textScaleFactor: 4,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)
                            )
                          ),
                        )
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      child: MongolElevatedButton(
                        onPressed: () {
                          
                        },
                        child: MongolText(
                          'ᠨᠢᠭᠤᠣᠠ\nᠦᠭᠡ\nᠪᠠᠨ\nᠮᠠᠷᠲᠠᠪᠠ', 
                          style: TextStyle(fontFamily: 'TraditionalMongolian', color: Colors.grey),
                          textScaleFactor: 3,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)
                            )
                          ),
                        )
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

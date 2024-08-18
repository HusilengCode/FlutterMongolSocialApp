import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readky/route/slide_page_route.dart';
import 'package:readky/view/screens/page_switch.dart';
import 'package:readky/view/widgets/custom_text_field.dart';
import 'package:mongol/mongol.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      labelText: 'ᠳ᠋ᠤᠭᠠᠷ',
                      hintText: 'ᠤᠲᠠᠰᠤᠨ ᠳ᠋ᠤᠭᠠᠷ',
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
                  SizedBox(
                    height: 100,
                    child: CustomTextField(
                      labelText: 'Re Password',
                      obsecureText: true,
                      hintText: '********',
                    ),
                  ),
                ],
              ),
            ),
            // Section 3 - Register Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/2.1),
              child: MongolElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(SlidePageRoute(child: PageSwitch()));
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
            ),
          ],
        ),
      ),
    );
  }
}

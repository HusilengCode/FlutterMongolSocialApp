// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mongol/mongol.dart';
import 'package:readky/view/widgets/custom_app_bar.dart';
import 'package:readky/view/widgets/profile_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html' as html;
import 'package:readky/model/core/news.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Uint8List> _imageDataList = [];  // List to store selected images as Uint8List
  List<String> _imageUrlList = [];  // List to store uploaded image URLs
  Map<String, dynamic> newData = {};
  TextEditingController _controller = TextEditingController();

//   final newData = {
//   'title': 'New Title',
//   'description': 'This is a new description',
//   'date': 'Aug 18, 2021',
//   'author': 'John Doe',
//   'photo': [
//       'https://i.ibb.co/6Jd811M/1f46e57bc40a.jpg',
//       'https://i.ibb.co/6Jd811M/1f46e57bc40a.jpg',
//   ]
// };


  // Function to pick multiple images for Web using FileUploadInputElement
  void pickImagesWeb() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.multiple = true;  // Allow multiple selection
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        for (var file in files) {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          reader.onLoadEnd.listen((event) {
            setState(() {
              _imageDataList.add(reader.result as Uint8List);
            });
          });
        }
      }
    });
  }

  // Function to pick multiple images for Mobile using image_picker
  Future<void> pickImagesMobile() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();  // Pick multiple images

    if (pickedFiles != null) {
      for (var pickedFile in pickedFiles) {
        final bytes = await io.File(pickedFile.path).readAsBytes();
        setState(() {
          _imageDataList.add(bytes);
        });
      }
    }
  }

  // Function to handle the image picking process for both web and mobile
  void pickImage() {
    if (kIsWeb) {
      pickImagesWeb();  // Web
    } else {
      pickImagesMobile();  // Mobile (iOS/Android)
    }
  }


  Future<void> addNewDocument(Map<String, dynamic> newDocument) async {
  final String apiUrl = 'http://localhost:3000/add-document'; // Your backend URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(newDocument),
    );

    if (response.statusCode == 200) {
      print('Document added successfully');
    } else {
      print('Failed to add document: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  // Function to upload all selected images to Imgbb
  Future<void> uploadToImgbb() async {
    if (_imageDataList.isEmpty) return;

    final String apiKey = '915bbebc5ff7bc3a3b4030a802532430';  // Replace with your Imgbb API key

    for (var imageData in _imageDataList) {
      final String base64Image = base64Encode(imageData);

      final response = await http.post(
        Uri.parse('https://api.imgbb.com/1/upload'),
        body: {
          'key': apiKey,
          'image': base64Image,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          _imageUrlList.add(jsonResponse['data']['url']);  // Add the uploaded image URL to the list
        });
      } else {
        print("Failed to upload image: ${response.statusCode}");
      }
      // Get the current date and time
      DateTime now = DateTime.now();
      // Format the date and time
      String formattedTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);

      newData['title'] = 'New title';
      newData['date'] = formattedTime;
      newData['author'] = 'Husileng';
      newData['description'] = _controller.text;
      newData['photo'] = _imageUrlList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIcon: Icon(
          Icons.arrow_back_ios,
          color: Colors.yellow,
        ),
        onPressedLeading: () {
          Navigator.of(context).pop();
        },
        actions: [], 
        profilePicture: Icon(CupertinoIcons.checkmark_alt, color: Colors.yellow, size: 32,), 
        onPressedProfilePicture: () async {
          await uploadToImgbb();  // Execute the first function and wait for it to complete
          await addNewDocument(newData); 
          Navigator.of(context).pop();  // Execute the second function after the first one completes
        },
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: BouncingScrollPhysics(),
        children: [
          // //  Section 1 = Profile Info
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //   width: MediaQuery.of(context).size.width,
          //   height: 110,
          //   color: Colors.black,
          //   alignment: Alignment.topCenter,
          //   child: ProfileInfoCard(
          //     username: 'Shasy Re',
          //     subscriptionStatus: 'Basic Account',
          //   ),
          // ),
          // Section 2 - Banner
          Container(
              height: MediaQuery.of(context).size.height - 60,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  // Expanded(
                  //   child: Text(
                  //     'Hey, its seems like you \nhavent read any news today.',
                  //     style: TextStyle(
                  //       height: 150 / 105,
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: 'inter',
                  //     ),
                  //   ),
                  // ),
                  Flexible(
                    // child: Padding(
                    //       padding: const EdgeInsets.all(0.0),
                    //       child: SizedBox(
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height,

                            child: MongolTextField(
                              controller: _controller,
                              style: TextStyle(fontFamily: 'TraditionalMongolian', color: Colors.black, fontSize: 24),
                              maxLines: null,
                              minLines: 15,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ᠪᠤᠳᠤᠭᠰᠠᠨ ᠰᠠᠨᠠᠭᠰᠠᠨ ᠵᠢᠠᠨ ᠬᠤᠪᠢᠶᠠᠯᠴᠠᠭᠠᠷᠠᠢ ᠂᠂᠂᠂᠂᠂᠂᠂',
                              ),
                            ),
                        //   ),
                        // ),
                  ),

                  if (_imageDataList.isNotEmpty) ...[
                       // Expanded widget to ensure GridView takes available space
                       Expanded(
                         child: GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 3,  // Display 3 images per row
                             crossAxisSpacing: 4.0,
                             mainAxisSpacing: 4.0,
                           ),
                           itemCount: _imageDataList.length,
                           itemBuilder: (context, index) {
                             return Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: Image.memory(
                                 _imageDataList[index],
                                 fit: BoxFit.cover,
                               ),
                             );
                           },
                         ),
                       ),
                       SizedBox(height: 20),
                       ElevatedButton(
                         onPressed: uploadToImgbb,
                         child: Text("Upload to Imgbb"),
                       ),
                      //  if (_imageUrlList.isNotEmpty) ...[
                      //    SizedBox(height: 20),
                      //    Text("Uploaded Image URLs:"),
                      //    for (var url in _imageUrlList) Text(url),  // Display Imgbb URLs after upload
                      //  ],
                     ] else
                       

                     MongolElevatedButton.icon(
                       onPressed: pickImage,
                       icon: Icon(Icons.photo), // Icon for Pick Image Icons.photo
                       label: MongolText(
                        style: TextStyle(fontFamily: 'TraditionalMongolian', fontSize: 24),
                        'ᠵᠢᠷᠤᠭ'),
                     ),
                      // SizedBox(width: 20), 
                      // ElevatedButton.icon(
                      //   onPressed: _imageFile != null ? () => _uploadImage(_imageFile!) : null,
                      //   icon: Icon(Icons.cloud_upload), // Icon for Upload Image
                      //   label: Text('Upload Image'),
                      // ),

                  
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(0xFF252525),
                  //     padding: EdgeInsets.only(left: 14, top: 7, bottom: 7, right: 8),
                  //     textStyle: TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 10,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Text('Read Now'),
                  //       SizedBox(width: 6),
                  //       Icon(
                  //         Icons.arrow_forward,
                  //         color: Colors.white,
                  //         size: 14,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
        ],
      ),
    );
  }

  Container _buildMenuTitle(BuildContext context, {required String title}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 10, top: 15),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'inter'),
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, {required String title, required String desciption, required Function onTap, required Widget icon}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color(0xFFE5E5E5)),
              child: Center(child: icon),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      desciption,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[350],
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

//  Upload Image From Device
// Function Start
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }
  // Function End



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Upload Image'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              getImage();
            },
            child: Container(
                child: image == null
                    ? Center(
                        child: Text('Pick Image'),
                      )
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      )),
          ),
          SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {
             
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
              child: Center(child: Text('Upload')),
            ),
          ),
        ],
      ),
    );
  }
}

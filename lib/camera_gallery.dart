import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lems/confirm.dart';

import 'add_dis.dart';

class camera_gallery extends StatefulWidget {
  const camera_gallery();

  @override
  State<camera_gallery> createState() => _camera_galleryState();
}

class _camera_galleryState extends State<camera_gallery> {
  File? _image;
  Future getimage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        this._image = imagetemp;
      });
    } on PlatformException catch (e) {
      print('failed to  pick image:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(
            'Insert Image',
          ),
          backgroundColor: Colors.amber,
        ),
        body: Scaffold(
          body: Column(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 300,
                              height: 300,
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/insert_image.jpg',
                                    )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              getimage(ImageSource.camera);
                                            },
                                            icon: Icon(
                                              Icons.camera,
                                              size: 40,
                                              color: Colors.white,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'Camera',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  width: 150,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            getimage(ImageSource.gallery);
                                          },
                                          icon: Icon(
                                            Icons.photo_album,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'From gallary',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  width: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: _image != null
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return confirm(_image);
                                }));
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 20, right: 70, left: 70),
                              child: Text(
                                'Done',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        : Text('')),
              ),
            ],
          ),
        )));
  }
}

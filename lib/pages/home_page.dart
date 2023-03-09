import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imgtotxt/pages/recognize_page.dart';
import 'package:imgtotxt/widgets/modal_dialog.dart';
import 'package:imgtotxt/widgets/image_picker_class.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgtotxt/widgets/image_cropper_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imgPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        height: 200,
        width: 200,
        child: imgPath == ''? Text('no image') : Image.file(File(imgPath)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          modalDialog(context, onCameraTap: () {
            pickImage(context, ImageSource.camera).then((value) => {
                  if (value != '')
                    {
                      cropImage(context, value).then((value) {
                        if (value != '') {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  RecognizationPage(path: value),
                            ),
                          );
                        }
                      }),
                      setState(() {
                        imgPath = value;
                      }),
                    }
                });
            Navigator.pop(context);
          }, onGalleryTap: () {
            pickImage(context, ImageSource.gallery).then((value) => {
                  if (value != '')
                    {
                      cropImage(context, value).then((value) {
                        if (value != '') {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) =>
                                  RecognizationPage(path: value),
                            ),
                          );
                        }
                      }),
                      setState(() {
                        imgPath = value;
                      }),
                    }
                });
            Navigator.pop(context);
          });
        },
        tooltip: 'Choose',
        label: const Text('Scan photo'),
      ),
    );
  }
}

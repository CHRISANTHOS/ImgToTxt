import 'package:flutter/material.dart';
import 'package:imgtotxt/widgets/modal_dialog.dart';
import 'package:imgtotxt/widgets/image_picker_class.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          modalDialog(context, onCameraTap: (){pickImage(context, ImageSource.camera);}, onGalleryTap: (){pickImage(context, ImageSource.gallery);});
        },
        tooltip: 'Choose',
        label: const Text('Scan photo'),
      ),
    );
  }
}
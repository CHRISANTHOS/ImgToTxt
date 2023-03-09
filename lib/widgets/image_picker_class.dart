import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:imgtotxt/pages/camera.dart';

Future<String> pickImage(BuildContext context,ImageSource? source)async{

  ImagePicker picker = ImagePicker();
  String path = '';

  try{
    final image = await picker.pickImage(source: source!);

    if(image != null){
      if(ImageSource != ImageSource.gallery){
        _showCamera(context, path);
      }
      path = image.path;
    }else{
      path = '';
    }
  }catch(e){
    print(e);
  }

  return path;

}

void _showCamera(BuildContext context, String path) async {
  final cameras = await availableCameras();
  final camera = cameras.first;
  final result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CameraPage(camera: camera)));
  path = result;
}
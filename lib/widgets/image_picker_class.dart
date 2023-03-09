import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

String path = '';

Future<String> pickImage(BuildContext context,ImageSource? source)async{

  ImagePicker picker = ImagePicker();

  try{
    final image = await picker.pickImage(source: source!);

    if(image != null){

      path = image.path;
    }else{
      path = '';
    }
  }catch(e){
    print(e);
  }

  return path;

}

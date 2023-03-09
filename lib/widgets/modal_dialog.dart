import 'package:flutter/material.dart';

void modalDialog(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}){
  showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: 200,
      child: Column(
        children: [
          ListTile(
            onTap: onCameraTap,
            leading: const Icon(Icons.camera),
            title: const Text('Camera', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
          ListTile(
            onTap: onGalleryTap,
            leading: const Icon(Icons.photo_album),
            title: const Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          )
        ],
      ),
    );
  });
}
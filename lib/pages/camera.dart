import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  CameraDescription camera;
  CameraPage({required this.camera});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> _initializeCameraControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeCameraControllerFuture = _cameraController.initialize();
  }

  void _takePicture(BuildContext context)async{
    try{
      await _initializeCameraControllerFuture;
      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      XFile picture = await _cameraController.takePicture();
      picture.saveTo(path);
      Navigator.pop(context, path);
    }catch(e){
      print(e);
    }
  }
  void _switchCamera()async{
    final cameras = await availableCameras();
    final frontCamera = cameras[1];
    widget.camera = frontCamera;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
            future: _initializeCameraControllerFuture,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return CameraPreview(_cameraController);
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }),
        Row(
          children: [
            SafeArea(child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(onPressed: (){
                  _takePicture(context);
                },backgroundColor: Colors.black, child: Icon(Icons.camera),),
              ),
            )),
            SafeArea(child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(onPressed: (){
                  _switchCamera();
                },backgroundColor: Colors.black, child: Icon(Icons.switch_camera),),
              ),
            )),
          ],
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizationPage extends StatefulWidget {

  String path;

  RecognizationPage({Key? key,required this.path}) : super(key: key);

  @override
  State<RecognizationPage> createState() => _RecognizationPageState();
}

class _RecognizationPageState extends State<RecognizationPage> {

  bool isBusy = false;
  TextEditingController controller = TextEditingController();

  void processImage(InputImage inputImage) {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      isBusy = true;
    });

    setState(() {
      isBusy = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InputImage inputImage = InputImage.fromFilePath(widget.path);
    processImage(inputImage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recognize Text'),
      ),
      body: isBusy == true ? const Center(child: CircularProgressIndicator(),) : TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'your text'
        ),
      ),
    );
  }
}

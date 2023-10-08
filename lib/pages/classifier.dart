import 'dart:io';
import 'dart:js';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Classifier {
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/model.tflite');
  }

  Future<List<Prediction>> predict(XFile imageFile) async {
    // Load the image file.
    img.Image image = img.decodeImage(await imageFile.readAsBytes())!;

    // Resize the image to the input size of the model (224x224).
    image = img.copyResize(image, width: 224, height: 224);

    // Convert the resized image to a Float32List.
    Float32List input = Float32List.fromList(image.data as List<double>);

    // Run the prediction.
    var output = <List<List<double>>>[List.filled(1, List.filled(1, 0.0))];
    _interpreter.run(input, output);

    // Get the class labels.
    List<String> labels = (await DefaultAssetBundle.of(context as BuildContext).loadString('assets/labels.txt')) as List<String>;

    // Get the top 5 predictions.
    List<Prediction> predictions = [];
    for (int i = 0; i < 5; i++) {
      int classIndex = output[0][0].indexOf(output[0][0].reduce((a, b) => a > b ? a : b));
      double confidence = output[0][0][classIndex];
      predictions.add(Prediction(classIndex, labels[classIndex], confidence));
    }

    return predictions;
  }
}

class Prediction {
  final int index;
  final String label;
  final double confidence;

  Prediction(this.index, this.label, this.confidence);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Classifier classifier = Classifier();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    classifier.loadModel();
  }

  Future<void> classifyImage() async {
    if (_image == null) return;

    List<Prediction> predictions = await classifier.predict(_image!);

    // Print or display the predictions as needed.
    for (Prediction prediction in predictions) {
      print('Label: ${prediction.label}, Confidence: ${prediction.confidence}');
    }
  }

  Future<void> openCamera() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = imageFile;
    });
    classifyImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Classification'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected')
            : Image.file(File(_image!.path)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        tooltip: 'Take a Picture',
        child: Icon(Icons.camera),
      ),
    );
  }
}

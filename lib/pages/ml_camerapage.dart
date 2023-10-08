import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class Classifier {
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/model.tflite');
    print(_interpreter);
  }

 Future<List<Prediction>> classifyImage(XFile imageFile,BuildContext context) async {
    // Load the image file.
    img.Image image = img.decodeImage(await imageFile.readAsBytes())!;

    // Resize the image to the input size of the model (224x224).
    image = img.copyResize(image, width: 224, height: 224);

    // Convert the resized image to a Float32List.
    Float32List input = Float32List.fromList(image.data as List<double>);

    // Run the prediction.
    var output = <List<List<List<double>>>>[List.filled(1, List.filled(1, List.filled(1, 0.0)))];
    _interpreter.run(input, output);

    // Process the model output based on the actual format of your model.
    // Adjust this part based on your model's output format.

    List<Prediction> predictions = [];

    // Placeholder code: Extracting a single value for demonstration.
    double confidence = output[0][0][0][0]; // Adjust this based on your model's output format.

    // Get the class labels.
    List<String> labels = (await DefaultAssetBundle.of(context).loadString('assets/labels.txt')) as List<String>;

    // Create a single prediction with the highest confidence.
    int classIndex = 0; // Placeholder class index; replace with your logic.
    String label = labels[classIndex]; // Placeholder label; replace with your logic.

    predictions.add(Prediction(classIndex, label, confidence));

    return predictions;
  }
}

class Prediction {
  final int index;
  final String label;
  final double confidence;

  Prediction(this.index, this.label, this.confidence);
}

class TFLite extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TFLite> {
  final Classifier classifier = Classifier();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    classifier.loadModel();
  }

  Future<void> classifyImage() async {
    if (_image == null) return;

    List<Prediction> predictions = await classifier.classifyImage(_image!, context);

    // Print or display the predictions as needed.
    for (Prediction prediction in predictions) {
      print('Label: ${prediction.label}, Confidence: ${prediction.confidence}');
    }
  }

  Future<void> openCamera() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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

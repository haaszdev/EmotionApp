import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

void main() {
  runApp(FaceDetectionApp());
}

class FaceDetectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FaceDetectionScreen(),
    );
  }
}

class FaceDetectionScreen extends StatefulWidget {
  @override
  _FaceDetectionScreenState createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;
  final picker = ImagePicker();
  final FaceDetector faceDetector = FaceDetector(
      options: FaceDetectorOptions(
    enableClassification: true, // Necessário para detecção de emoções
  ));

  String _faceMessage = "Nenhum rosto detectado";
  String _emoji = "😐"; // Emoji neutro por padrão

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _faceMessage = "Analisando...";
        _emoji = "🔍"; // Ícone de análise
      });
      _detectFaces();
    }
  }

  Future<void> _detectFaces() async {
    if (_image == null) return;

    final inputImage = InputImage.fromFile(_image!);
    final List<Face> faces = await faceDetector.processImage(inputImage);

    if (faces.isNotEmpty) {
      final face = faces.first; // Pega apenas o primeiro rosto encontrado
      final smileProb = face.smilingProbability ?? 0.0;
      final leftEyeOpenProb = face.leftEyeOpenProbability ?? 0.0;
      final rightEyeOpenProb = face.rightEyeOpenProbability ?? 0.0;

      setState(() {
        if (smileProb > 0.7) {
          _emoji = "😃";
          _faceMessage = "Feliz";
        } else if (smileProb > 0.4) {
          _emoji = "🙂"; 
          _faceMessage = "Neutro";
        } else if (leftEyeOpenProb < 0.3 && rightEyeOpenProb < 0.3) {
          _emoji = "😴"; 
          _faceMessage = "Sonolento";
        } else {
          _emoji = "😢"; 
          _faceMessage = "Triste";
        }
      });
    } else {
      setState(() {
        _faceMessage = "Nenhum rosto detectado";
        _emoji = "❌";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detector de Emoções')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image != null
              ? Image.file(_image!, height: 300)
              : Icon(Icons.image, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(_emoji, style: TextStyle(fontSize: 50)), // Mostra o emoji correspondente
          SizedBox(height: 10),
          Text(_faceMessage, style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.camera),
                child: Text('Tirar Foto'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.gallery),
                child: Text('Escolher da Galeria'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

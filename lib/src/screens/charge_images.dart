import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImageSelector extends StatefulWidget {
  const MultipleImageSelector({super.key});

  @override
  State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  void _finishSelection() {
    // Navega hacia atrás y pasa las imágenes seleccionadas como resultado.
    Navigator.of(context).pop(selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    // display image selected from gallery
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Images Select'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('Select Image from Gallery and Camera'),
              onPressed: () {
                getImages();
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "GFG",
                style: TextStyle(color: Colors.green),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 300.0,
                child: selectedImages.isEmpty
                    ? const Center(child: Text('Sorry nothing selected!!'))
                    : GridView.builder(
                        itemCount: selectedImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: kIsWeb
                                  ? Image.network(selectedImages[index].path)
                                  : Image.file(selectedImages[index]));
                        },
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: _finishSelection,
              child: Text('Terminar'),
            ),
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}

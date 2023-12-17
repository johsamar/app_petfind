// import 'package:flutter/material.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

// class ImagePickerScreen extends StatefulWidget {
//   @override
//   _ImagePickerScreenState createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   List<Asset> _images = <Asset>[];

//   Future<void> _pickImages() async {
//     List<Asset> resultList = <Asset>[];
//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 10,
//         enableCamera: true,
//         selectedAssets: _images,
//         cupertinoOptions: CupertinoOptions(
//           takePhotoIcon: "chat",
//         ),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Seleccionar Imágenes",
//           allViewTitle: "Todas las Imágenes",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } catch (e) {
//       // Maneja errores aquí
//     }

//     if (!mounted) return;

//     setState(() {
//       _images = resultList;
//     });
//   }

//   void _finishSelection() {
//     // Navega hacia atrás y pasa las imágenes seleccionadas como resultado.
//     Navigator.of(context).pop(_images);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MultiImagePicker Screen'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton.icon(
//             onPressed: _pickImages,
//             icon: Icon(Icons.add_a_photo),
//             label: Text('Seleccionar Imágenes'),
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 4.0,
//                 mainAxisSpacing: 4.0,
//               ),
//               itemCount: _images.length,
//               itemBuilder: (context, index) {
//                 return AssetThumb(
//                   asset: _images[index],
//                   width: 300,
//                   height: 300,
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _finishSelection,
//             child: Text('Terminar'),
//           ),
//         ],
//       ),
//     );
//   }
// }

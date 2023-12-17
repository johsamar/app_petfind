// import 'package:flutter/material.dart';

// class ListMyPets extends StatefulWidget {
//   const ListMyPets({super.key});

//   @override
//   State<ListMyPets> createState() => _ListMyPetsState();
// }

// class _ListMyPetsState extends State<ListMyPets> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de Mascotas'),
//       ),
//       body: FutureBuilder(
//         future: _fetchPets(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<Pet> pets = snapshot.data as List<Pet>;

//             return ListView.builder(
//               itemCount: pets.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>
//                     //         PetDetailPage(petId: pets[index].id),
//                     //   ),
//                     // );
//                   },
//                   child: Card(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Image.network(
//                           pets[index].imageUrl,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             pets[index].name,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

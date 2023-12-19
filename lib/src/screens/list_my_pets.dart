import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/services/pet_service.dart';
import 'package:flutter/material.dart';

class ListMyPets extends StatefulWidget {
  const ListMyPets({super.key});

  @override
  State<ListMyPets> createState() => _ListMyPetsState();
}

class _ListMyPetsState extends State<ListMyPets> {
  String owner = '657f70180062fc8b9d98797c';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mascotas'),
      ),
      body: FutureBuilder(
        future: getPets(owner),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<PetModel> pets = snapshot.data as List<PetModel>;

            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         PetDetailPage(petId: pets[index].id),
                    //   ),
                    // );
                  },
                  child: Card(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image.network(
                        //   pets[index].imageUrl,
                        //   height: 200,
                        //   fit: BoxFit.cover,
                        // ),
                        Image(
                          image: AssetImage(
                              'assets/images/pet_default/${pets[index].specie}.png'),
                          height: 50,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pets[index].name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

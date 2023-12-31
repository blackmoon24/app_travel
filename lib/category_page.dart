import 'package:flutter/material.dart';
import 'package:app_travel/detail_screen.dart';
import 'package:app_travel/place_model.dart';
import 'package:app_travel/utilities/colors.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter data sesuai dengan kategori
    List filteredPlaces =
        places.where((place) => place.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Category $category'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: filteredPlaces.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Detail(placeInfo: filteredPlaces[index]),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    filteredPlaces[index].image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        filteredPlaces[index].name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          Text(
                            filteredPlaces[index].location,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            filteredPlaces[index].rate,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

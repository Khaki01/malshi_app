import 'package:flutter/material.dart';
import 'package:malshi_app/models/animal.dart';

class AnimalListTile extends StatelessWidget {
  final Animal animal;

  const AnimalListTile({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Colors.black,
    );

    IconData animalIcon = Icons.pets; // Default icon for an animal
    if (animal.type.toLowerCase() == 'horse') {
      animalIcon = Icons.pets; // Replace with your horse icon
    } else if (animal.type.toLowerCase() == 'cow') {
      animalIcon = Icons.pets; // Replace with your cow icon
    }
    // Add more conditions for other animal types as needed

    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            animalIcon,
            size: 40,
            color: Colors.black,
          ), // Use the appropriate icon
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(animal.tag,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Text(
                  'Age: ${animal.age}',
                  style: textStyle,
                ),
                Text(
                  'Breed: ${animal.breed}',
                  style: textStyle,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              // Implement edit functionality or navigation to the edit page
            },
          ),
        ],
      ),
    );
  }
}

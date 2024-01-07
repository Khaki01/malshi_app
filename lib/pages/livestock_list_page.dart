import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malshi_app/models/animal.dart';
import 'package:malshi_app/models/user.dart';
import 'package:malshi_app/pages/lifestock_pages/exist_lifestock_list_pages.dart';
import 'package:malshi_app/providers/user_provider.dart';
import 'package:malshi_app/utils/colors.dart';
import 'package:malshi_app/utils/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:malshi_app/widgets/animal_list_tile_widget.dart';

class ListStockPage extends StatefulWidget {
  const ListStockPage({super.key});

  @override
  State<ListStockPage> createState() => _ListStockPageState();
}

class _ListStockPageState extends State<ListStockPage> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    print(user.uid);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
          ),
          title: Text(
            "Livestock List",
            style: f16PB,
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tune,
                color: primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download,
                color: primaryColor,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('animals')
                .where('uid', isEqualTo: user.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text('No animals found'),
                );
              }

              // Build the ListView with animal data
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var animalData =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  Animal animal = Animal.fromSnap(snapshot.data!.docs[index]);
                  return AnimalListTile(animal: animal);
                },
              );
            }));
  }
}

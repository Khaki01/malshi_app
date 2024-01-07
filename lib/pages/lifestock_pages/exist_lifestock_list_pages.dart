import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malshi_app/models/user.dart';
import 'package:malshi_app/providers/user_provider.dart';
import 'package:malshi_app/resources/firestore_methods.dart';

import 'package:malshi_app/utils/colors.dart';
import 'package:malshi_app/utils/constants.dart';
import 'package:malshi_app/utils/text_styles.dart';
import 'package:malshi_app/utils/utils.dart';
import 'package:provider/provider.dart';

class AddNewLifeStock extends StatefulWidget {
  const AddNewLifeStock({super.key});

  @override
  State<AddNewLifeStock> createState() => _AddNewLifeStockState();
}

class _AddNewLifeStockState extends State<AddNewLifeStock> {
  Uint8List? _file;
  final TextEditingController _animalType = TextEditingController();
  final TextEditingController _animalBreed = TextEditingController();
  final TextEditingController _animalTag = TextEditingController();
  final TextEditingController _animalSex = TextEditingController();
  final TextEditingController _animalAge = TextEditingController();
  final TextEditingController _animalGroup = TextEditingController();
  final TextEditingController _animalAncestry = TextEditingController();
  void uploadAnimal(String uid, String username) async {
    try {
      String res = await FirestoreMethods().uploadAnimal(
        _file!,
        uid,
        username,
        _animalType.text,
        _animalBreed.text,
        _animalTag.text,
        _animalSex.text,
        _animalAge.text,
        _animalGroup.text,
        _animalAncestry.text,
      );

      _animalType.clear();
      _animalBreed.clear();
      _animalTag.clear();
      _animalSex.clear();
      _animalAge.clear();
      _animalGroup.clear();
      _animalAncestry.clear();
      setState(() {
        _file = null;
      });

      if (res == 'success') {
        showSnackBar(context, "Uploaded!");
      } else {
        showSnackBar(context, res);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Select Image"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _animalType.dispose();
    _animalBreed.dispose();
    _animalTag.dispose();
    _animalSex.dispose();
    _animalAge.dispose();
    _animalGroup.dispose();
    _animalAncestry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        title: Text(
          "New Animal",
          style: f16PB,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => uploadAnimal(user.uid, user.username),
            icon: const Icon(
              Icons.done,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              style: f16PB,
              controller: _animalType,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Animal type",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalBreed,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Animal breed",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalTag,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Tag number",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalSex,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Sex",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalAge,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Age",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalGroup,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Animal group",
                hintStyle: f16HB,
              ),
            ),
            h12,
            TextField(
              style: f16PB,
              controller: _animalAncestry,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                border: const OutlineInputBorder(),
                hintText: "Ancestry",
                hintStyle: f16HB,
              ),
            ),
            h12,
            InkWell(
              onTap: () {
                _selectImage(context);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor,
                ),
                child: _file == null
                    ? const Text("Upload photo")
                    : const Text("Edit photo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

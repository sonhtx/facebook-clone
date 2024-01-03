import 'dart:io';

import 'package:anti_fb/models/request/ReqSetUserinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:anti_fb/constants.dart';
import 'package:anti_fb/api/profile/profile_api.dart';
import 'package:anti_fb/models/User.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _descriptionController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _countryController;
  late TextEditingController _coinController;
  late XFile? avaImage;
  late XFile? coverImage;

  // ValueNotifier<XFile> avaNotifier = ValueNotifier<XFile>(XFile(''));
  // ValueNotifier<XFile> coverNotifier = ValueNotifier<XFile>(XFile(''));

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController(text: widget.user.username);
    _descriptionController =
        TextEditingController(text: widget.user.description);
    _addressController = TextEditingController(text: widget.user.address);
    _cityController = TextEditingController(text: widget.user.city);
    _countryController = TextEditingController(text: widget.user.country);
    _coinController = TextEditingController(text: "0");
    avaImage = null;
    coverImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImagePicker('Avatar', avaImage, true),
            _buildImagePicker('Cover Photo', coverImage, false),
            _buildTextField('Username', _usernameController),
            _buildTextField('Description', _descriptionController),
            _buildTextField('Address', _addressController),
            _buildTextField('City', _cityController),
            _buildTextField('Country', _countryController),
            _buildTextField('Buy coins', _coinController),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Save Profile'),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Future<void> pickImages(bool isAvatar) async {
    final ImagePicker picker = ImagePicker();

    // Open the image picker to select multiple images
    final XFile? pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      if(isAvatar){
        setState(() {
          avaImage = pickedImages;
        });
        // avaNotifier.value = pickedImages;
      } else {
        setState(() {
          coverImage = pickedImages;
        });
        // coverNotifier.value = pickedImages;
      }
    }
  }

  Widget _buildImagePicker(String title, XFile? image, bool isAvatar) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 18.0, fontWeight: FONTBOLD)),
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                setState(() {
                  image = null;
                });
              },
            )
          ],
        ),

        const SizedBox(height: 8.0),

        GestureDetector(
          onTap: () => pickImages(isAvatar),
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: GREY[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: image != null
                ? StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  children: [
                    StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ))
                  ]
                ) : const Icon(Icons.camera_alt, size: 50.0),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 18.0, fontWeight: FONTBOLD)),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: label,
          ),
          controller: controller,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }


  Future<void> _saveProfile() async {
    // Implement logic to save the profile information.
    // You can access the updated values using the controllers.

    ReqSetUserinfo info = ReqSetUserinfo();
    info.username = _usernameController.text;
    info.description = _descriptionController.text;
    info.address = _addressController.text;
    info.city = _cityController.text;
    info.country = _countryController.text;
    info.link = widget.user.link;

    info.avatar = avaImage;
    info.cover_image = coverImage;

    ProfileApi papi = ProfileApi();
    final bool status = await papi.setUserInfo1(info);

    if(status){
      ScaffoldMessenger.of(context).showSnackBar(snackBarChangeProfileOK);
    } else {
      showNotification(
          context, "Error", "There was an error when trying to change profile");
    }
  }
}

final snackBarChangeProfileOK = SnackBar(
  content: const Text('Change profile successfully, refresh page to see the change'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);
import 'dart:convert';

import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:anti_fb/models/post/PostListData.dart';
import 'package:anti_fb/models/request/ReqSetUserinfo.dart';
import 'package:anti_fb/ui/homepage/homepage/listpost.dart';
import 'package:anti_fb/ui/profile/profile_screen.dart';
import 'package:anti_fb/widgets1/friends_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/models/info.dart';
import 'package:anti_fb/constants.dart';
import 'package:anti_fb/storage.dart';
import 'package:anti_fb/api/profile/profile_api.dart';
import 'package:anti_fb/api/profile/userinfo_api.dart';
import 'package:anti_fb/models/User.dart';
import 'package:anti_fb/widgets1/friend_grid_view.dart';
import 'package:anti_fb/widgets1/custom_button.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

Map<String, dynamic> json = {
  'id': '339',
  "username": "Thomas Shelby",
  "description": "All religion is a foolish answer to a foolish question.",
  "avatar":
      "https://it4788.catan.io.vn/files/avatar-1702051303359-135313063.jpg",
  "cover_image":
      "https://it4788.catan.io.vn/files//cover_image-1702052928186-131402460.jpg",
  "link": "https://peaky-blinders.fandom.com/wiki/Thomas_Shelby",
  "address": "Small Health",
  "city": "Birmingham",
  "country": "United Kingdom",
  "coins": "0",
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfilePage(user: User.fromJson(json)),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage({required this.user});

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
  String imageUrlAva = "";
  String imageUrlCover = "";

  @override
  void initState() {
    super.initState();
    storage.write(
        key: 'token',
        value:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzM5LCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDQyNjAzNTV9.q9vW9_a7aXtwYMPtL3Mr2C0uE0ilh4csxG309HEdjWk');
    _usernameController = TextEditingController(text: widget.user.username);
    _descriptionController =
        TextEditingController(text: widget.user.description);
    _addressController = TextEditingController(text: widget.user.address);
    _cityController = TextEditingController(text: widget.user.city);
    _countryController = TextEditingController(text: widget.user.country);
    _coinController = TextEditingController(text: "0");
    imageUrlAva = widget.user.avatar;
    imageUrlCover = widget.user.coverImage;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImagePicker('Avatar', widget.user.avatar, true),
              _buildImagePicker('Cover Photo', widget.user.coverImage, false),
              _buildTextField('Username', _usernameController),
              _buildTextField('Description', _descriptionController),
              _buildTextField('Address', _addressController),
              _buildTextField('City', _cityController),
              _buildTextField('Country', _countryController),
              _buildTextField('Buy coins', _coinController),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(String title, String imageUrl, bool isAvatar) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: () => _pickImage(imageUrl, isAvatar),
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: imageUrl.isNotEmpty
                ? Image.network(imageUrl, fit: BoxFit.cover)
                : Icon(Icons.camera_alt, size: 50.0),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: label,
          ),
          controller: controller,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Future<void> _pickImage(String imagePath, bool isAvatar) async {
    // Implement image picking logic here, for example, using image picker package.
    // Update the imagePath variable with the selected image.
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (isAvatar) {
          imageUrlAva = pickedFile.path;
        } else {
          imageUrlCover = pickedFile.path;
        }
      });
    }
  }

  Future<void> _saveProfile() async {
    // Implement logic to save the profile information.
    // You can access the updated values using the controllers.
    final updatedUser = User(
      id: widget.user.id,
      avatar: widget.user.avatar,
      coverImage: widget.user.coverImage,
      username: _usernameController.text,
      description: _descriptionController.text,
      address: _addressController.text,
      city: _cityController.text,
      country: _countryController.text,
      coins: _coinController.text,
      link: widget.user.link,
    );

    ReqSetUserinfo info = ReqSetUserinfo();
    info.username = widget.user.username;
    info.description = widget.user.description;
    info.address = widget.user.address;
    info.city = widget.user.city;
    info.country = widget.user.country;
    info.link = widget.user.link;

    info.avatar = null;
    info.cover_image = null;

    ProfileApi papi = ProfileApi();
    await papi.setUserInfo1(info);
    // await papi.buyCoins(widget.user.coins);
    // Use the updatedUser object as needed.
  }
}

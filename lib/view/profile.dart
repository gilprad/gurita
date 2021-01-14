import 'package:flutter/material.dart';
import 'package:gurita/components/buton.dart';
import 'package:gurita/components/constant.dart';
import 'package:gurita/components/form.dart';
import 'package:gurita/components/responsive.dart';
import 'package:gurita/components/teks.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // PickedFile = _imageFile;
  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      // _imageFile = pickedFile;
    });
  }

  @override
  void initState() {
    super.initState();
    // takePhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Teks(
          isi: "Profil",
        ),
      ),
      body: Container(
        width: displayWidth(context),
        height: displayHeight(context),
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.03,
            vertical: displayHeight(context) * 0.03),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ProfilePicture(context),
            SizedBox(height: 20),
            Forms(
              forms: "Nama",
            ),
            SizedBox(height: 10),
            Forms(
              forms: "Email",
            ),
            SizedBox(height: 10),
            Forms(
              forms: "No. Telpon",
            ),
            SizedBox(
              height: 250,
            ),
            Buttons(
              isiButton: "Save",
            )
          ],
        ),
      ),
    );
  }

  Widget ProfilePicture(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/icons/math.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              pressed(context);
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.black,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  void pressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: 120,
            width: displayWidth(context) * 1,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Teks(
                  isi: "Pilih foto profil dari",
                  size: 23,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton.icon(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                      },
                      label: Teks(
                        isi: "Kamera",
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },
                      label: Teks(isi: "Galeri", size: 18),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}

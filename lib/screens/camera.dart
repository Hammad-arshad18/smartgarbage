import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image_file;

  void get_image({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        image_file = File(file!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image_file != null
              ? Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image_file != null
                          ? FileImage(image_file!)
                          : const AssetImage('assets/images/Logo.png')
                              as ImageProvider,
                      fit: BoxFit.contain,
                    ),
                    color: Colors.grey[300],
                    border: Border.all(
                      color: const Color.fromRGBO(143, 148, 251, 1.0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      color: const Color.fromRGBO(143, 148, 251, 1.0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Image",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 30.0,
                    color: Color.fromRGBO(143, 148, 251, 1.0),
                  ),
                  onPressed: () {
                    get_image(source: ImageSource.camera);
                  },
                  label: const Text(
                    "Camera",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.image,
                    size: 30.0,
                    color: Color.fromRGBO(143, 148, 251, 1.0),
                  ),
                  onPressed: () {
                    get_image(source: ImageSource.gallery);
                  },
                  label: const Text(
                    "Gallery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.adjust,
                size: 30.0,
                color: Color.fromRGBO(143, 148, 251, 1.0),
              ),
              label: const Text(
                "Detect",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

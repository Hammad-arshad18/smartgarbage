import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartgarbage/models/user_model.dart';
import 'package:smartgarbage/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  DocumentSnapshot? userdata;
  late String email, username;

  Future<void> getuserdata() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) => {
              setState(() {
                username = value['username'];
                email = value['email'];
              }),
            });
  }

  @override
  void initState() {
    getuserdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: const Image(
                image: AssetImage('assets/images/hammad.jpg'),
                fit: BoxFit.fill,
                width: 125,
                height: 130,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(2, 2),
                  ),
                ]),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "${username}",
                      style: const TextStyle(
                        fontSize: 50.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "${email}",
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.admin_panel_settings_rounded,
                          color: Colors.redAccent,
                          size: 30.0,
                        ),
                        Text(
                          "Admin",
                          style: TextStyle(fontSize: 30.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Logoutuser();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void Logoutuser() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        {Fluttertoast.showToast(msg: "$username Logout Successfully")});
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}

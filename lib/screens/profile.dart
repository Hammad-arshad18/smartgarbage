import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartgarbage/models/user_model.dart';
import 'package:smartgarbage/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:api_cache_manager/api_cache_manager.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  // DocumentSnapshot? userdata;
  late String email, username;
  // List? userData;

  Future getuserdata() async {
    var cacheManager = await APICacheManager().getCacheData("username");
    // print(cacheManager.syncData);
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/employee/${cacheManager.syncData}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // getuserdata();
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
        child: ListView(children: [
          CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: const Image(
                image: AssetImage('assets/images/profileImage.png'),
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
              child: FutureBuilder(
                future: getuserdata(),
                builder: (context, AsyncSnapshot snapshot) {
                  // print("Print");
                  if (snapshot.hasData && snapshot.data != null) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data[0]['username'] as String,
                              style: const TextStyle(
                                fontSize: 50.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              snapshot.data[0]['email'] as String,
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
                                  "Employee",
                                  style: TextStyle(fontSize: 30.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Logoutuser();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurpleAccent),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 12)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
        ]));
  }

  void Logoutuser() async {
    var cacheModel = await APICacheManager().getCacheData("login_token");
    var delCacheModel = await APICacheManager().deleteCache("login_token");
    var deluserModel = await APICacheManager().deleteCache("username");
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/auth/accounts/logout/');
    Map<String, dynamic> jsonData = {'key': cacheModel.syncData};
    var response = await http.post(url, body: jsonData);
    var data = jsonDecode(response.body);
    var detail = data["detail"];
    print("Logout : $data");

    // Fluttertoast.showToast(msg: "$detail");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}

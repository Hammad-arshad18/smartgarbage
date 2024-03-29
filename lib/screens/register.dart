import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartgarbage/models/user_model.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:smartgarbage/services/register_service.dart';

class Register extends StatefulWidget {
  static const String id = "Register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var isobsecure = true;
  var passfieldicon = const Icon(Icons.visibility);
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      width: 80.0,
                      height: 180,
                      left: 15.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        )),
                      ),
                    ),
                    Positioned(
                      width: 80.0,
                      height: 100,
                      left: 80.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        )),
                      ),
                    ),
                    Positioned(
                      width: 80.0,
                      height: 100.0,
                      right: 50.0,
                      top: 20.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Form(
                      key: _key,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 10.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                          border: Border.all(
                            color: const Color.fromRGBO(143, 148, 251, .2),
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: _usernamecontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "UserName Is Required";
                                  } else if (value.contains("")) {
                                    return "Empty Spaces & - Are Not Allowed To Use in Username";
                                  }
                                },
                                onSaved: (value) {
                                  _usernamecontroller.text = value!;
                                },
                                decoration: InputDecoration(
                                  hintText: "UserName",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(5.0),
                                  label: const Text("UserName"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                              child: Divider(
                                thickness: 1.4,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: _emailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email Field Is Required";
                                  } else if (!value.contains('@')) {
                                    return "Enter Valid Email";
                                  }
                                },
                                onSaved: (value) {
                                  _emailcontroller.text = value!;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(5.0),
                                  label: const Text("Email Address"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                              child: Divider(
                                thickness: 1.4,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isobsecure,
                                controller: _passwordcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password Field Is Required";
                                  } else if (value.length < 8) {
                                    return "Password Should Be of Minimum 8 Characters";
                                  }
                                },
                                onSaved: (value) {
                                  _passwordcontroller.text = value!;
                                },
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isobsecure) {
                                          isobsecure = false;
                                          passfieldicon =
                                              const Icon(Icons.visibility_off);
                                        } else {
                                          isobsecure = true;
                                          passfieldicon =
                                              const Icon(Icons.visibility);
                                        }
                                      });
                                    },
                                    icon: passfieldicon,
                                    tooltip: "Visibility Button",
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5.0),
                                  label: const Text("Password"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1.0),
                            Color.fromRGBO(143, 148, 251, 0.6),
                          ],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          RegisterUser(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            username: _usernamecontroller.text,
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Register",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                        child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Already Have An Account ? Login",
                        style: TextStyle(
                            color: Color.fromRGBO(102, 110, 243, 2.0),
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void RegisterUser(
      {required email, required password, required username}) async {
    final registerService = RegisterService();
    if (_key.currentState!.validate()) {
      // print(responseBody);
      await registerService.RegisterApi({
        "username": username,
        "email": email,
        "password1": password,
        "password2": password
      }).then((value) async {
        if (value.username != null &&
            value.password != null &&
            value.email != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Registration Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  '${value.username}\n${value.email}\n${value.password}',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ]),
          );
        } else if (value.username != null && value.email != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Registration Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  '${value.username}\n${value.email}',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ]),
          );
        } else if (value.username != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Registration Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  '${value.username}',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ]),
          );
        } else if (value.email != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Registration Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  '${value.email}',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ]),
          );
        } else if (value.password != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text(
                  'Registration Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  '${value.password}',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ]),
          );
        } else {
          // print(value.token);
          Fluttertoast.showToast(
              msg: "Register Successful! Please Confirm Your Email");
          APICacheDBModel userDetail =
              APICacheDBModel(key: "username", syncData: username);
          await APICacheManager().addCacheData(userDetail);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()));
        }
      });
    }
  }
}

//   postDetailsToFiresbase() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//     UserModel userModel = UserModel();
//     userModel.uid = user!.uid;
//     userModel.Email = _emailcontroller.text;
//     userModel.Username = _usernamecontroller.text;
//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());
//     Fluttertoast.showToast(msg: "User Register Successfully");
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => VerifyEmail()));
//   }
// }

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartgarbage/screens/forget_pass.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:smartgarbage/screens/register.dart';
import 'package:smartgarbage/services/login_service.dart';
import 'package:api_cache_manager/api_cache_manager.dart';

class Login extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isobsecure = true;
  var passfieldicon = Icon(Icons.visibility);
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passwordcontroller = new TextEditingController();
  // final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      "Login",
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
              child: Column(children: [
                Form(
                  key: _formkey,
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
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 10)),
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: _emailcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Username Is Required";
                                  }
                                },
                                onSaved: (value) {
                                  _emailcontroller.text = value!;
                                },
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5.0),
                                  label: const Text("Username"),
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
                                textInputAction: TextInputAction.done,
                                controller: _passwordcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password Field Is Required";
                                  } else if (value.length < 8) {
                                    return "Password Should Be of Minimum 8 Characters";
                                  }
                                },
                                obscureText: isobsecure,
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
                    ]),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    // SignIn(
                    //   email: _emailcontroller.text,
                    //   password: _passwordcontroller.text,
                    // );
                    signInApi(
                      username: _emailcontroller.text,
                      password: _passwordcontroller.text,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1.0),
                          Color.fromRGBO(143, 148, 251, 0.6),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Register.id);
                          },
                          child: const Text(
                            "Don't Have Account ? Register",
                            style: TextStyle(
                                color: Color.fromRGBO(102, 110, 243, 2.0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, ForgetPassword.id),
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Color.fromRGBO(102, 110, 243, 2.0),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void signInApi({required username, required password}) async {
    final loginService = LoginService();
    if (_formkey.currentState!.validate()) {
      Center(child: CircularProgressIndicator());
      loginService.loginApiCall({
        "username": username,
        "password": password,
      }).then((value) async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
        if (value.error != null) {
          // print("My Value : ${value.error}");
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text(
                'Login Error',
                textAlign: TextAlign.center,
              ),
              content: Text(
                '${value.error}',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                )
              ],
            ),
          );
        } else {
          // print("My Value : ${value.token}");
          // Fluttertoast.showToast(msg: "Login Successful");
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

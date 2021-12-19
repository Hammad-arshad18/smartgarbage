import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:smartgarbage/screens/register.dart';

class Login extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var isobsecure = true;
  var passfieldicon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
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
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Container(
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
                    padding: EdgeInsets.all(5),
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
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              label: Text("Email Address"),
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
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isobsecure) {
                                      isobsecure = false;
                                      passfieldicon =
                                          Icon(Icons.visibility_off);
                                    } else {
                                      isobsecure = true;
                                      passfieldicon = Icon(Icons.visibility);
                                    }
                                  });
                                },
                                icon: passfieldicon,
                              ),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              label: Text("Password"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HomePage.id);
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
                  )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
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
              ))
            ]),
          ),
        ],
      ),
    );
  }
}
